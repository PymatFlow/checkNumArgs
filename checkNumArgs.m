function [ x, er ] = checkNumArgs( x, siz, intFlag, signFlag )


xname = inputname(1); er='';
if( isempty(siz) ); siz = size(x); end;
if( length(siz)==1 ); siz=[siz siz]; end;

% first check that x is numeric
if( ~isnumeric(x) ); er = [xname ' not numeric']; return; end;

% if x is a scalar, simply replicate it.
xorig = x; if( length(x)==1); x = x(ones(siz)); end;

% regardless, must have same number of x as n
if( length(siz)~=ndims(x) || ~all(size(x)==siz) )
 er = ['has size = [' num2str(size(x)) '], '];
 er = [er 'which is not the required size of [' num2str(siz) ']'];
 er = createErrMsg( xname, xorig, er ); return;
end

% check that x are the right type of integers (unless intFlag==-1)
switch intFlag
 case 0
 if( ~all(mod(x,1)==0))
 er = 'must have integer entries';
 er = createErrMsg( xname, xorig, er); return;
 end;
 case 1
 if( ~all(mod(x,2)==1))
 er = 'must have odd integer entries';
 er = createErrMsg( xname, xorig, er); return;
 end;
 case 2
 if( ~all(mod(x,2)==0))
 er = 'must have even integer entries';
 er = createErrMsg( xname, xorig, er ); return;
 end;
end;

% check sign of entries in x (unless signFlag==0)
switch signFlag
 case -2
 if( ~all(x<0))
 er = 'must have strictly negative entries';
 er = createErrMsg( xname, xorig, er ); return;
 end;
 case -1
 if( ~all(x<=0))
 er = 'must have negative entries';
 er = createErrMsg( xname, xorig, er ); return;
 end;
 case 1
 if( ~all(x>=0))
 er = 'must have positive entries';
 er = createErrMsg( xname, xorig, er ); return;
 end;
 case 2
 if( ~all(x>0))
 er = 'must have strictly positive entries';
 er = createErrMsg( xname, xorig, er ); return;
 end
end

function er = createErrMsg( xname, x, er )
if(numel(x)<10)
 er = ['Numeric input argument ' xname '=[' num2str(x) '] ' er '.'];
else
 er = ['Numeric input argument ' xname ' ' er '.'];
end