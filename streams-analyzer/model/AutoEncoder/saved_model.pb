ащ
эа
9
Add
x"T
y"T
z"T"
Ttype:
2	
Д
ApplyRMSProp
var"T

ms"T
mom"T
lr"T
rho"T
momentum"T
epsilon"T	
grad"T
out"T"
Ttype:
2	"
use_lockingbool( 
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
4
Fill
dims

value"T
output"T"	
Ttype
>
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
:
Greater
x"T
y"T
z
"
Ttype:
2		
S
HistogramSummary
tag
values"T
summary"
Ttype0:
2		
.
Identity

input"T
output"T"	
Ttype
+
Log
x"T
y"T"
Ttype:	
2
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2

Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
:
Maximum
x"T
y"T
z"T"
Ttype:	
2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
8
MergeSummary
inputs*N
summary"
Nint(0
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(

Min

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
<
Mul
x"T
y"T
z"T"
Ttype:
2	
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
5
Pow
x"T
y"T
z"T"
Ttype:
	2	

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	

RandomStandardNormal

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
M
ScalarSummary
tags
values"T
summary"
Ttype:
2		
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
/
Sigmoid
x"T
y"T"
Ttype:	
2
<
SigmoidGrad
y"T
dy"T
z"T"
Ttype:	
2
,
Sqrt
x"T
y"T"
Ttype:	
2
0
Square
x"T
y"T"
Ttype:
	2	
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
9
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring 
&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.4.02
b'unknown'ЪІ
t
Input/PlaceholderPlaceholder*
dtype0*
shape:џџџџџџџџџ*'
_output_shapes
:џџџџџџџџџ
d
random_normal/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
W
random_normal/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
Y
random_normal/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

"random_normal/RandomStandardNormalRandomStandardNormalrandom_normal/shape*

seed *
seed2 *
dtype0*
_output_shapes

:*
T0
{
random_normal/mulMul"random_normal/RandomStandardNormalrandom_normal/stddev*
_output_shapes

:*
T0
d
random_normalAddrandom_normal/mulrandom_normal/mean*
_output_shapes

:*
T0
z
weight
VariableV2*
	container *
dtype0*
shape
:*
_output_shapes

:*
shared_name 

weight/AssignAssignweightrandom_normal*
_class
loc:@weight*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
c
weight/readIdentityweight*
_class
loc:@weight*
_output_shapes

:*
T0
f
random_normal_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
Y
random_normal_1/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_1/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
Ђ
$random_normal_1/RandomStandardNormalRandomStandardNormalrandom_normal_1/shape*

seed *
seed2 *
dtype0*
_output_shapes

:*
T0

random_normal_1/mulMul$random_normal_1/RandomStandardNormalrandom_normal_1/stddev*
_output_shapes

:*
T0
j
random_normal_1Addrandom_normal_1/mulrandom_normal_1/mean*
_output_shapes

:*
T0
|
weight_1
VariableV2*
	container *
dtype0*
shape
:*
_output_shapes

:*
shared_name 
Ѓ
weight_1/AssignAssignweight_1random_normal_1*
_class
loc:@weight_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
i
weight_1/readIdentityweight_1*
_class
loc:@weight_1*
_output_shapes

:*
T0
f
random_normal_2/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
Y
random_normal_2/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_2/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
Ђ
$random_normal_2/RandomStandardNormalRandomStandardNormalrandom_normal_2/shape*

seed *
seed2 *
dtype0*
_output_shapes

:*
T0

random_normal_2/mulMul$random_normal_2/RandomStandardNormalrandom_normal_2/stddev*
_output_shapes

:*
T0
j
random_normal_2Addrandom_normal_2/mulrandom_normal_2/mean*
_output_shapes

:*
T0
|
weight_2
VariableV2*
	container *
dtype0*
shape
:*
_output_shapes

:*
shared_name 
Ѓ
weight_2/AssignAssignweight_2random_normal_2*
_class
loc:@weight_2*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
i
weight_2/readIdentityweight_2*
_class
loc:@weight_2*
_output_shapes

:*
T0
f
random_normal_3/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
Y
random_normal_3/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_3/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
Ђ
$random_normal_3/RandomStandardNormalRandomStandardNormalrandom_normal_3/shape*

seed *
seed2 *
dtype0*
_output_shapes

:*
T0

random_normal_3/mulMul$random_normal_3/RandomStandardNormalrandom_normal_3/stddev*
_output_shapes

:*
T0
j
random_normal_3Addrandom_normal_3/mulrandom_normal_3/mean*
_output_shapes

:*
T0
|
weight_3
VariableV2*
	container *
dtype0*
shape
:*
_output_shapes

:*
shared_name 
Ѓ
weight_3/AssignAssignweight_3random_normal_3*
_class
loc:@weight_3*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
i
weight_3/readIdentityweight_3*
_class
loc:@weight_3*
_output_shapes

:*
T0
_
random_normal_4/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_4/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_4/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_4/RandomStandardNormalRandomStandardNormalrandom_normal_4/shape*

seed *
seed2 *
dtype0*
_output_shapes
:*
T0
}
random_normal_4/mulMul$random_normal_4/RandomStandardNormalrandom_normal_4/stddev*
_output_shapes
:*
T0
f
random_normal_4Addrandom_normal_4/mulrandom_normal_4/mean*
_output_shapes
:*
T0
p
bias
VariableV2*
	container *
dtype0*
shape:*
_output_shapes
:*
shared_name 

bias/AssignAssignbiasrandom_normal_4*
_class
	loc:@bias*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
Y
	bias/readIdentitybias*
_class
	loc:@bias*
_output_shapes
:*
T0
_
random_normal_5/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_5/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_5/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_5/RandomStandardNormalRandomStandardNormalrandom_normal_5/shape*

seed *
seed2 *
dtype0*
_output_shapes
:*
T0
}
random_normal_5/mulMul$random_normal_5/RandomStandardNormalrandom_normal_5/stddev*
_output_shapes
:*
T0
f
random_normal_5Addrandom_normal_5/mulrandom_normal_5/mean*
_output_shapes
:*
T0
r
bias_1
VariableV2*
	container *
dtype0*
shape:*
_output_shapes
:*
shared_name 

bias_1/AssignAssignbias_1random_normal_5*
_class
loc:@bias_1*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
_
bias_1/readIdentitybias_1*
_class
loc:@bias_1*
_output_shapes
:*
T0
_
random_normal_6/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_6/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_6/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_6/RandomStandardNormalRandomStandardNormalrandom_normal_6/shape*

seed *
seed2 *
dtype0*
_output_shapes
:*
T0
}
random_normal_6/mulMul$random_normal_6/RandomStandardNormalrandom_normal_6/stddev*
_output_shapes
:*
T0
f
random_normal_6Addrandom_normal_6/mulrandom_normal_6/mean*
_output_shapes
:*
T0
r
bias_2
VariableV2*
	container *
dtype0*
shape:*
_output_shapes
:*
shared_name 

bias_2/AssignAssignbias_2random_normal_6*
_class
loc:@bias_2*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
_
bias_2/readIdentitybias_2*
_class
loc:@bias_2*
_output_shapes
:*
T0
_
random_normal_7/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Y
random_normal_7/meanConst*
dtype0*
_output_shapes
: *
valueB
 *    
[
random_normal_7/stddevConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

$random_normal_7/RandomStandardNormalRandomStandardNormalrandom_normal_7/shape*

seed *
seed2 *
dtype0*
_output_shapes
:*
T0
}
random_normal_7/mulMul$random_normal_7/RandomStandardNormalrandom_normal_7/stddev*
_output_shapes
:*
T0
f
random_normal_7Addrandom_normal_7/mulrandom_normal_7/mean*
_output_shapes
:*
T0
r
bias_3
VariableV2*
	container *
dtype0*
shape:*
_output_shapes
:*
shared_name 

bias_3/AssignAssignbias_3random_normal_7*
_class
loc:@bias_3*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
_
bias_3/readIdentitybias_3*
_class
loc:@bias_3*
_output_shapes
:*
T0

Encode_Layer_1/MatMulMatMulInput/Placeholderweight/read*
transpose_a( *
transpose_b( *'
_output_shapes
:џџџџџџџџџ*
T0
m
Encode_Layer_1/AddAddEncode_Layer_1/MatMul	bias/read*'
_output_shapes
:џџџџџџџџџ*
T0
g
Encode_Layer_1/SigmoidSigmoidEncode_Layer_1/Add*'
_output_shapes
:џџџџџџџџџ*
T0
g
%Encode_Layer_1/weights/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
n
,Encode_Layer_1/weights/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
n
,Encode_Layer_1/weights/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
к
&Encode_Layer_1/weights/summaries/rangeRange,Encode_Layer_1/weights/summaries/range/start%Encode_Layer_1/weights/summaries/Rank,Encode_Layer_1/weights/summaries/range/delta*

Tidx0*
_output_shapes
:
 
%Encode_Layer_1/weights/summaries/MeanMeanweight/read&Encode_Layer_1/weights/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

*Encode_Layer_1/weights/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *6
value-B+ B%Encode_Layer_1/weights/summaries/mean
Њ
%Encode_Layer_1/weights/summaries/meanScalarSummary*Encode_Layer_1/weights/summaries/mean/tags%Encode_Layer_1/weights/summaries/Mean*
_output_shapes
: *
T0

+Encode_Layer_1/weights/summaries/stddev/subSubweight/read%Encode_Layer_1/weights/summaries/Mean*
_output_shapes

:*
T0

.Encode_Layer_1/weights/summaries/stddev/SquareSquare+Encode_Layer_1/weights/summaries/stddev/sub*
_output_shapes

:*
T0
~
-Encode_Layer_1/weights/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
б
,Encode_Layer_1/weights/summaries/stddev/MeanMean.Encode_Layer_1/weights/summaries/stddev/Square-Encode_Layer_1/weights/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

,Encode_Layer_1/weights/summaries/stddev/SqrtSqrt,Encode_Layer_1/weights/summaries/stddev/Mean*
_output_shapes
: *
T0

.Encode_Layer_1/weights/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *:
value1B/ B)Encode_Layer_1/weights/summaries/stddev_1
Й
)Encode_Layer_1/weights/summaries/stddev_1ScalarSummary.Encode_Layer_1/weights/summaries/stddev_1/tags,Encode_Layer_1/weights/summaries/stddev/Sqrt*
_output_shapes
: *
T0
i
'Encode_Layer_1/weights/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
p
.Encode_Layer_1/weights/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Encode_Layer_1/weights/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Encode_Layer_1/weights/summaries/range_1Range.Encode_Layer_1/weights/summaries/range_1/start'Encode_Layer_1/weights/summaries/Rank_1.Encode_Layer_1/weights/summaries/range_1/delta*

Tidx0*
_output_shapes
:
 
$Encode_Layer_1/weights/summaries/MaxMaxweight/read(Encode_Layer_1/weights/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Encode_Layer_1/weights/summaries/max/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Encode_Layer_1/weights/summaries/max
Ї
$Encode_Layer_1/weights/summaries/maxScalarSummary)Encode_Layer_1/weights/summaries/max/tags$Encode_Layer_1/weights/summaries/Max*
_output_shapes
: *
T0
i
'Encode_Layer_1/weights/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
p
.Encode_Layer_1/weights/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Encode_Layer_1/weights/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Encode_Layer_1/weights/summaries/range_2Range.Encode_Layer_1/weights/summaries/range_2/start'Encode_Layer_1/weights/summaries/Rank_2.Encode_Layer_1/weights/summaries/range_2/delta*

Tidx0*
_output_shapes
:
 
$Encode_Layer_1/weights/summaries/MinMinweight/read(Encode_Layer_1/weights/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Encode_Layer_1/weights/summaries/min/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Encode_Layer_1/weights/summaries/min
Ї
$Encode_Layer_1/weights/summaries/minScalarSummary)Encode_Layer_1/weights/summaries/min/tags$Encode_Layer_1/weights/summaries/Min*
_output_shapes
: *
T0

.Encode_Layer_1/weights/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *;
value2B0 B*Encode_Layer_1/weights/summaries/histogram

*Encode_Layer_1/weights/summaries/histogramHistogramSummary.Encode_Layer_1/weights/summaries/histogram/tagweight/read*
_output_shapes
: *
T0
f
$Encode_Layer_1/biases/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
m
+Encode_Layer_1/biases/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
m
+Encode_Layer_1/biases/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
ж
%Encode_Layer_1/biases/summaries/rangeRange+Encode_Layer_1/biases/summaries/range/start$Encode_Layer_1/biases/summaries/Rank+Encode_Layer_1/biases/summaries/range/delta*

Tidx0*
_output_shapes
:

$Encode_Layer_1/biases/summaries/MeanMean	bias/read%Encode_Layer_1/biases/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Encode_Layer_1/biases/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Encode_Layer_1/biases/summaries/mean
Ї
$Encode_Layer_1/biases/summaries/meanScalarSummary)Encode_Layer_1/biases/summaries/mean/tags$Encode_Layer_1/biases/summaries/Mean*
_output_shapes
: *
T0

*Encode_Layer_1/biases/summaries/stddev/subSub	bias/read$Encode_Layer_1/biases/summaries/Mean*
_output_shapes
:*
T0

-Encode_Layer_1/biases/summaries/stddev/SquareSquare*Encode_Layer_1/biases/summaries/stddev/sub*
_output_shapes
:*
T0
v
,Encode_Layer_1/biases/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ю
+Encode_Layer_1/biases/summaries/stddev/MeanMean-Encode_Layer_1/biases/summaries/stddev/Square,Encode_Layer_1/biases/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

+Encode_Layer_1/biases/summaries/stddev/SqrtSqrt+Encode_Layer_1/biases/summaries/stddev/Mean*
_output_shapes
: *
T0

-Encode_Layer_1/biases/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *9
value0B. B(Encode_Layer_1/biases/summaries/stddev_1
Ж
(Encode_Layer_1/biases/summaries/stddev_1ScalarSummary-Encode_Layer_1/biases/summaries/stddev_1/tags+Encode_Layer_1/biases/summaries/stddev/Sqrt*
_output_shapes
: *
T0
h
&Encode_Layer_1/biases/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
o
-Encode_Layer_1/biases/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Encode_Layer_1/biases/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Encode_Layer_1/biases/summaries/range_1Range-Encode_Layer_1/biases/summaries/range_1/start&Encode_Layer_1/biases/summaries/Rank_1-Encode_Layer_1/biases/summaries/range_1/delta*

Tidx0*
_output_shapes
:

#Encode_Layer_1/biases/summaries/MaxMax	bias/read'Encode_Layer_1/biases/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Encode_Layer_1/biases/summaries/max/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Encode_Layer_1/biases/summaries/max
Є
#Encode_Layer_1/biases/summaries/maxScalarSummary(Encode_Layer_1/biases/summaries/max/tags#Encode_Layer_1/biases/summaries/Max*
_output_shapes
: *
T0
h
&Encode_Layer_1/biases/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
o
-Encode_Layer_1/biases/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Encode_Layer_1/biases/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Encode_Layer_1/biases/summaries/range_2Range-Encode_Layer_1/biases/summaries/range_2/start&Encode_Layer_1/biases/summaries/Rank_2-Encode_Layer_1/biases/summaries/range_2/delta*

Tidx0*
_output_shapes
:

#Encode_Layer_1/biases/summaries/MinMin	bias/read'Encode_Layer_1/biases/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Encode_Layer_1/biases/summaries/min/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Encode_Layer_1/biases/summaries/min
Є
#Encode_Layer_1/biases/summaries/minScalarSummary(Encode_Layer_1/biases/summaries/min/tags#Encode_Layer_1/biases/summaries/Min*
_output_shapes
: *
T0

-Encode_Layer_1/biases/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *:
value1B/ B)Encode_Layer_1/biases/summaries/histogram

)Encode_Layer_1/biases/summaries/histogramHistogramSummary-Encode_Layer_1/biases/summaries/histogram/tag	bias/read*
_output_shapes
: *
T0

Encode_Layer_2/MatMulMatMulEncode_Layer_1/Sigmoidweight_1/read*
transpose_a( *
transpose_b( *'
_output_shapes
:џџџџџџџџџ*
T0
o
Encode_Layer_2/AddAddEncode_Layer_2/MatMulbias_1/read*'
_output_shapes
:џџџџџџџџџ*
T0
g
Encode_Layer_2/SigmoidSigmoidEncode_Layer_2/Add*'
_output_shapes
:џџџџџџџџџ*
T0
g
%Encode_Layer_2/weights/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
n
,Encode_Layer_2/weights/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
n
,Encode_Layer_2/weights/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
к
&Encode_Layer_2/weights/summaries/rangeRange,Encode_Layer_2/weights/summaries/range/start%Encode_Layer_2/weights/summaries/Rank,Encode_Layer_2/weights/summaries/range/delta*

Tidx0*
_output_shapes
:
Ђ
%Encode_Layer_2/weights/summaries/MeanMeanweight_1/read&Encode_Layer_2/weights/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

*Encode_Layer_2/weights/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *6
value-B+ B%Encode_Layer_2/weights/summaries/mean
Њ
%Encode_Layer_2/weights/summaries/meanScalarSummary*Encode_Layer_2/weights/summaries/mean/tags%Encode_Layer_2/weights/summaries/Mean*
_output_shapes
: *
T0

+Encode_Layer_2/weights/summaries/stddev/subSubweight_1/read%Encode_Layer_2/weights/summaries/Mean*
_output_shapes

:*
T0

.Encode_Layer_2/weights/summaries/stddev/SquareSquare+Encode_Layer_2/weights/summaries/stddev/sub*
_output_shapes

:*
T0
~
-Encode_Layer_2/weights/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
б
,Encode_Layer_2/weights/summaries/stddev/MeanMean.Encode_Layer_2/weights/summaries/stddev/Square-Encode_Layer_2/weights/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

,Encode_Layer_2/weights/summaries/stddev/SqrtSqrt,Encode_Layer_2/weights/summaries/stddev/Mean*
_output_shapes
: *
T0

.Encode_Layer_2/weights/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *:
value1B/ B)Encode_Layer_2/weights/summaries/stddev_1
Й
)Encode_Layer_2/weights/summaries/stddev_1ScalarSummary.Encode_Layer_2/weights/summaries/stddev_1/tags,Encode_Layer_2/weights/summaries/stddev/Sqrt*
_output_shapes
: *
T0
i
'Encode_Layer_2/weights/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
p
.Encode_Layer_2/weights/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Encode_Layer_2/weights/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Encode_Layer_2/weights/summaries/range_1Range.Encode_Layer_2/weights/summaries/range_1/start'Encode_Layer_2/weights/summaries/Rank_1.Encode_Layer_2/weights/summaries/range_1/delta*

Tidx0*
_output_shapes
:
Ђ
$Encode_Layer_2/weights/summaries/MaxMaxweight_1/read(Encode_Layer_2/weights/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Encode_Layer_2/weights/summaries/max/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Encode_Layer_2/weights/summaries/max
Ї
$Encode_Layer_2/weights/summaries/maxScalarSummary)Encode_Layer_2/weights/summaries/max/tags$Encode_Layer_2/weights/summaries/Max*
_output_shapes
: *
T0
i
'Encode_Layer_2/weights/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
p
.Encode_Layer_2/weights/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Encode_Layer_2/weights/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Encode_Layer_2/weights/summaries/range_2Range.Encode_Layer_2/weights/summaries/range_2/start'Encode_Layer_2/weights/summaries/Rank_2.Encode_Layer_2/weights/summaries/range_2/delta*

Tidx0*
_output_shapes
:
Ђ
$Encode_Layer_2/weights/summaries/MinMinweight_1/read(Encode_Layer_2/weights/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Encode_Layer_2/weights/summaries/min/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Encode_Layer_2/weights/summaries/min
Ї
$Encode_Layer_2/weights/summaries/minScalarSummary)Encode_Layer_2/weights/summaries/min/tags$Encode_Layer_2/weights/summaries/Min*
_output_shapes
: *
T0

.Encode_Layer_2/weights/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *;
value2B0 B*Encode_Layer_2/weights/summaries/histogram

*Encode_Layer_2/weights/summaries/histogramHistogramSummary.Encode_Layer_2/weights/summaries/histogram/tagweight_1/read*
_output_shapes
: *
T0
f
$Encode_Layer_2/biases/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
m
+Encode_Layer_2/biases/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
m
+Encode_Layer_2/biases/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
ж
%Encode_Layer_2/biases/summaries/rangeRange+Encode_Layer_2/biases/summaries/range/start$Encode_Layer_2/biases/summaries/Rank+Encode_Layer_2/biases/summaries/range/delta*

Tidx0*
_output_shapes
:

$Encode_Layer_2/biases/summaries/MeanMeanbias_1/read%Encode_Layer_2/biases/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Encode_Layer_2/biases/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Encode_Layer_2/biases/summaries/mean
Ї
$Encode_Layer_2/biases/summaries/meanScalarSummary)Encode_Layer_2/biases/summaries/mean/tags$Encode_Layer_2/biases/summaries/Mean*
_output_shapes
: *
T0

*Encode_Layer_2/biases/summaries/stddev/subSubbias_1/read$Encode_Layer_2/biases/summaries/Mean*
_output_shapes
:*
T0

-Encode_Layer_2/biases/summaries/stddev/SquareSquare*Encode_Layer_2/biases/summaries/stddev/sub*
_output_shapes
:*
T0
v
,Encode_Layer_2/biases/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ю
+Encode_Layer_2/biases/summaries/stddev/MeanMean-Encode_Layer_2/biases/summaries/stddev/Square,Encode_Layer_2/biases/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

+Encode_Layer_2/biases/summaries/stddev/SqrtSqrt+Encode_Layer_2/biases/summaries/stddev/Mean*
_output_shapes
: *
T0

-Encode_Layer_2/biases/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *9
value0B. B(Encode_Layer_2/biases/summaries/stddev_1
Ж
(Encode_Layer_2/biases/summaries/stddev_1ScalarSummary-Encode_Layer_2/biases/summaries/stddev_1/tags+Encode_Layer_2/biases/summaries/stddev/Sqrt*
_output_shapes
: *
T0
h
&Encode_Layer_2/biases/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
o
-Encode_Layer_2/biases/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Encode_Layer_2/biases/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Encode_Layer_2/biases/summaries/range_1Range-Encode_Layer_2/biases/summaries/range_1/start&Encode_Layer_2/biases/summaries/Rank_1-Encode_Layer_2/biases/summaries/range_1/delta*

Tidx0*
_output_shapes
:

#Encode_Layer_2/biases/summaries/MaxMaxbias_1/read'Encode_Layer_2/biases/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Encode_Layer_2/biases/summaries/max/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Encode_Layer_2/biases/summaries/max
Є
#Encode_Layer_2/biases/summaries/maxScalarSummary(Encode_Layer_2/biases/summaries/max/tags#Encode_Layer_2/biases/summaries/Max*
_output_shapes
: *
T0
h
&Encode_Layer_2/biases/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
o
-Encode_Layer_2/biases/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Encode_Layer_2/biases/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Encode_Layer_2/biases/summaries/range_2Range-Encode_Layer_2/biases/summaries/range_2/start&Encode_Layer_2/biases/summaries/Rank_2-Encode_Layer_2/biases/summaries/range_2/delta*

Tidx0*
_output_shapes
:

#Encode_Layer_2/biases/summaries/MinMinbias_1/read'Encode_Layer_2/biases/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Encode_Layer_2/biases/summaries/min/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Encode_Layer_2/biases/summaries/min
Є
#Encode_Layer_2/biases/summaries/minScalarSummary(Encode_Layer_2/biases/summaries/min/tags#Encode_Layer_2/biases/summaries/Min*
_output_shapes
: *
T0

-Encode_Layer_2/biases/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *:
value1B/ B)Encode_Layer_2/biases/summaries/histogram

)Encode_Layer_2/biases/summaries/histogramHistogramSummary-Encode_Layer_2/biases/summaries/histogram/tagbias_1/read*
_output_shapes
: *
T0

Decode_Layer_1/MatMulMatMulEncode_Layer_2/Sigmoidweight_2/read*
transpose_a( *
transpose_b( *'
_output_shapes
:џџџџџџџџџ*
T0
o
Decode_Layer_1/AddAddDecode_Layer_1/MatMulbias_2/read*'
_output_shapes
:џџџџџџџџџ*
T0
g
Decode_Layer_1/SigmoidSigmoidDecode_Layer_1/Add*'
_output_shapes
:џџџџџџџџџ*
T0
g
%Decode_Layer_1/weights/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
n
,Decode_Layer_1/weights/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
n
,Decode_Layer_1/weights/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
к
&Decode_Layer_1/weights/summaries/rangeRange,Decode_Layer_1/weights/summaries/range/start%Decode_Layer_1/weights/summaries/Rank,Decode_Layer_1/weights/summaries/range/delta*

Tidx0*
_output_shapes
:
Ђ
%Decode_Layer_1/weights/summaries/MeanMeanweight_2/read&Decode_Layer_1/weights/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

*Decode_Layer_1/weights/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *6
value-B+ B%Decode_Layer_1/weights/summaries/mean
Њ
%Decode_Layer_1/weights/summaries/meanScalarSummary*Decode_Layer_1/weights/summaries/mean/tags%Decode_Layer_1/weights/summaries/Mean*
_output_shapes
: *
T0

+Decode_Layer_1/weights/summaries/stddev/subSubweight_2/read%Decode_Layer_1/weights/summaries/Mean*
_output_shapes

:*
T0

.Decode_Layer_1/weights/summaries/stddev/SquareSquare+Decode_Layer_1/weights/summaries/stddev/sub*
_output_shapes

:*
T0
~
-Decode_Layer_1/weights/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
б
,Decode_Layer_1/weights/summaries/stddev/MeanMean.Decode_Layer_1/weights/summaries/stddev/Square-Decode_Layer_1/weights/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

,Decode_Layer_1/weights/summaries/stddev/SqrtSqrt,Decode_Layer_1/weights/summaries/stddev/Mean*
_output_shapes
: *
T0

.Decode_Layer_1/weights/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *:
value1B/ B)Decode_Layer_1/weights/summaries/stddev_1
Й
)Decode_Layer_1/weights/summaries/stddev_1ScalarSummary.Decode_Layer_1/weights/summaries/stddev_1/tags,Decode_Layer_1/weights/summaries/stddev/Sqrt*
_output_shapes
: *
T0
i
'Decode_Layer_1/weights/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
p
.Decode_Layer_1/weights/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Decode_Layer_1/weights/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Decode_Layer_1/weights/summaries/range_1Range.Decode_Layer_1/weights/summaries/range_1/start'Decode_Layer_1/weights/summaries/Rank_1.Decode_Layer_1/weights/summaries/range_1/delta*

Tidx0*
_output_shapes
:
Ђ
$Decode_Layer_1/weights/summaries/MaxMaxweight_2/read(Decode_Layer_1/weights/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Decode_Layer_1/weights/summaries/max/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Decode_Layer_1/weights/summaries/max
Ї
$Decode_Layer_1/weights/summaries/maxScalarSummary)Decode_Layer_1/weights/summaries/max/tags$Decode_Layer_1/weights/summaries/Max*
_output_shapes
: *
T0
i
'Decode_Layer_1/weights/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
p
.Decode_Layer_1/weights/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Decode_Layer_1/weights/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Decode_Layer_1/weights/summaries/range_2Range.Decode_Layer_1/weights/summaries/range_2/start'Decode_Layer_1/weights/summaries/Rank_2.Decode_Layer_1/weights/summaries/range_2/delta*

Tidx0*
_output_shapes
:
Ђ
$Decode_Layer_1/weights/summaries/MinMinweight_2/read(Decode_Layer_1/weights/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Decode_Layer_1/weights/summaries/min/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Decode_Layer_1/weights/summaries/min
Ї
$Decode_Layer_1/weights/summaries/minScalarSummary)Decode_Layer_1/weights/summaries/min/tags$Decode_Layer_1/weights/summaries/Min*
_output_shapes
: *
T0

.Decode_Layer_1/weights/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *;
value2B0 B*Decode_Layer_1/weights/summaries/histogram

*Decode_Layer_1/weights/summaries/histogramHistogramSummary.Decode_Layer_1/weights/summaries/histogram/tagweight_2/read*
_output_shapes
: *
T0
f
$Decode_Layer_1/biases/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
m
+Decode_Layer_1/biases/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
m
+Decode_Layer_1/biases/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
ж
%Decode_Layer_1/biases/summaries/rangeRange+Decode_Layer_1/biases/summaries/range/start$Decode_Layer_1/biases/summaries/Rank+Decode_Layer_1/biases/summaries/range/delta*

Tidx0*
_output_shapes
:

$Decode_Layer_1/biases/summaries/MeanMeanbias_2/read%Decode_Layer_1/biases/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Decode_Layer_1/biases/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Decode_Layer_1/biases/summaries/mean
Ї
$Decode_Layer_1/biases/summaries/meanScalarSummary)Decode_Layer_1/biases/summaries/mean/tags$Decode_Layer_1/biases/summaries/Mean*
_output_shapes
: *
T0

*Decode_Layer_1/biases/summaries/stddev/subSubbias_2/read$Decode_Layer_1/biases/summaries/Mean*
_output_shapes
:*
T0

-Decode_Layer_1/biases/summaries/stddev/SquareSquare*Decode_Layer_1/biases/summaries/stddev/sub*
_output_shapes
:*
T0
v
,Decode_Layer_1/biases/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ю
+Decode_Layer_1/biases/summaries/stddev/MeanMean-Decode_Layer_1/biases/summaries/stddev/Square,Decode_Layer_1/biases/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

+Decode_Layer_1/biases/summaries/stddev/SqrtSqrt+Decode_Layer_1/biases/summaries/stddev/Mean*
_output_shapes
: *
T0

-Decode_Layer_1/biases/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *9
value0B. B(Decode_Layer_1/biases/summaries/stddev_1
Ж
(Decode_Layer_1/biases/summaries/stddev_1ScalarSummary-Decode_Layer_1/biases/summaries/stddev_1/tags+Decode_Layer_1/biases/summaries/stddev/Sqrt*
_output_shapes
: *
T0
h
&Decode_Layer_1/biases/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
o
-Decode_Layer_1/biases/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Decode_Layer_1/biases/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Decode_Layer_1/biases/summaries/range_1Range-Decode_Layer_1/biases/summaries/range_1/start&Decode_Layer_1/biases/summaries/Rank_1-Decode_Layer_1/biases/summaries/range_1/delta*

Tidx0*
_output_shapes
:

#Decode_Layer_1/biases/summaries/MaxMaxbias_2/read'Decode_Layer_1/biases/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Decode_Layer_1/biases/summaries/max/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Decode_Layer_1/biases/summaries/max
Є
#Decode_Layer_1/biases/summaries/maxScalarSummary(Decode_Layer_1/biases/summaries/max/tags#Decode_Layer_1/biases/summaries/Max*
_output_shapes
: *
T0
h
&Decode_Layer_1/biases/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
o
-Decode_Layer_1/biases/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Decode_Layer_1/biases/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Decode_Layer_1/biases/summaries/range_2Range-Decode_Layer_1/biases/summaries/range_2/start&Decode_Layer_1/biases/summaries/Rank_2-Decode_Layer_1/biases/summaries/range_2/delta*

Tidx0*
_output_shapes
:

#Decode_Layer_1/biases/summaries/MinMinbias_2/read'Decode_Layer_1/biases/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Decode_Layer_1/biases/summaries/min/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Decode_Layer_1/biases/summaries/min
Є
#Decode_Layer_1/biases/summaries/minScalarSummary(Decode_Layer_1/biases/summaries/min/tags#Decode_Layer_1/biases/summaries/Min*
_output_shapes
: *
T0

-Decode_Layer_1/biases/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *:
value1B/ B)Decode_Layer_1/biases/summaries/histogram

)Decode_Layer_1/biases/summaries/histogramHistogramSummary-Decode_Layer_1/biases/summaries/histogram/tagbias_2/read*
_output_shapes
: *
T0

Decode_Layer_2/MatMulMatMulDecode_Layer_1/Sigmoidweight_3/read*
transpose_a( *
transpose_b( *'
_output_shapes
:џџџџџџџџџ*
T0
o
Decode_Layer_2/AddAddDecode_Layer_2/MatMulbias_3/read*'
_output_shapes
:џџџџџџџџџ*
T0
g
Decode_Layer_2/SigmoidSigmoidDecode_Layer_2/Add*'
_output_shapes
:џџџџџџџџџ*
T0
g
%Decode_Layer_2/weights/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
n
,Decode_Layer_2/weights/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
n
,Decode_Layer_2/weights/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
к
&Decode_Layer_2/weights/summaries/rangeRange,Decode_Layer_2/weights/summaries/range/start%Decode_Layer_2/weights/summaries/Rank,Decode_Layer_2/weights/summaries/range/delta*

Tidx0*
_output_shapes
:
Ђ
%Decode_Layer_2/weights/summaries/MeanMeanweight_3/read&Decode_Layer_2/weights/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

*Decode_Layer_2/weights/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *6
value-B+ B%Decode_Layer_2/weights/summaries/mean
Њ
%Decode_Layer_2/weights/summaries/meanScalarSummary*Decode_Layer_2/weights/summaries/mean/tags%Decode_Layer_2/weights/summaries/Mean*
_output_shapes
: *
T0

+Decode_Layer_2/weights/summaries/stddev/subSubweight_3/read%Decode_Layer_2/weights/summaries/Mean*
_output_shapes

:*
T0

.Decode_Layer_2/weights/summaries/stddev/SquareSquare+Decode_Layer_2/weights/summaries/stddev/sub*
_output_shapes

:*
T0
~
-Decode_Layer_2/weights/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
б
,Decode_Layer_2/weights/summaries/stddev/MeanMean.Decode_Layer_2/weights/summaries/stddev/Square-Decode_Layer_2/weights/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

,Decode_Layer_2/weights/summaries/stddev/SqrtSqrt,Decode_Layer_2/weights/summaries/stddev/Mean*
_output_shapes
: *
T0

.Decode_Layer_2/weights/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *:
value1B/ B)Decode_Layer_2/weights/summaries/stddev_1
Й
)Decode_Layer_2/weights/summaries/stddev_1ScalarSummary.Decode_Layer_2/weights/summaries/stddev_1/tags,Decode_Layer_2/weights/summaries/stddev/Sqrt*
_output_shapes
: *
T0
i
'Decode_Layer_2/weights/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
p
.Decode_Layer_2/weights/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Decode_Layer_2/weights/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Decode_Layer_2/weights/summaries/range_1Range.Decode_Layer_2/weights/summaries/range_1/start'Decode_Layer_2/weights/summaries/Rank_1.Decode_Layer_2/weights/summaries/range_1/delta*

Tidx0*
_output_shapes
:
Ђ
$Decode_Layer_2/weights/summaries/MaxMaxweight_3/read(Decode_Layer_2/weights/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Decode_Layer_2/weights/summaries/max/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Decode_Layer_2/weights/summaries/max
Ї
$Decode_Layer_2/weights/summaries/maxScalarSummary)Decode_Layer_2/weights/summaries/max/tags$Decode_Layer_2/weights/summaries/Max*
_output_shapes
: *
T0
i
'Decode_Layer_2/weights/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
p
.Decode_Layer_2/weights/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
p
.Decode_Layer_2/weights/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
т
(Decode_Layer_2/weights/summaries/range_2Range.Decode_Layer_2/weights/summaries/range_2/start'Decode_Layer_2/weights/summaries/Rank_2.Decode_Layer_2/weights/summaries/range_2/delta*

Tidx0*
_output_shapes
:
Ђ
$Decode_Layer_2/weights/summaries/MinMinweight_3/read(Decode_Layer_2/weights/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Decode_Layer_2/weights/summaries/min/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Decode_Layer_2/weights/summaries/min
Ї
$Decode_Layer_2/weights/summaries/minScalarSummary)Decode_Layer_2/weights/summaries/min/tags$Decode_Layer_2/weights/summaries/Min*
_output_shapes
: *
T0

.Decode_Layer_2/weights/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *;
value2B0 B*Decode_Layer_2/weights/summaries/histogram

*Decode_Layer_2/weights/summaries/histogramHistogramSummary.Decode_Layer_2/weights/summaries/histogram/tagweight_3/read*
_output_shapes
: *
T0
f
$Decode_Layer_2/biases/summaries/RankConst*
dtype0*
_output_shapes
: *
value	B :
m
+Decode_Layer_2/biases/summaries/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
m
+Decode_Layer_2/biases/summaries/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
ж
%Decode_Layer_2/biases/summaries/rangeRange+Decode_Layer_2/biases/summaries/range/start$Decode_Layer_2/biases/summaries/Rank+Decode_Layer_2/biases/summaries/range/delta*

Tidx0*
_output_shapes
:

$Decode_Layer_2/biases/summaries/MeanMeanbias_3/read%Decode_Layer_2/biases/summaries/range*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

)Decode_Layer_2/biases/summaries/mean/tagsConst*
dtype0*
_output_shapes
: *5
value,B* B$Decode_Layer_2/biases/summaries/mean
Ї
$Decode_Layer_2/biases/summaries/meanScalarSummary)Decode_Layer_2/biases/summaries/mean/tags$Decode_Layer_2/biases/summaries/Mean*
_output_shapes
: *
T0

*Decode_Layer_2/biases/summaries/stddev/subSubbias_3/read$Decode_Layer_2/biases/summaries/Mean*
_output_shapes
:*
T0

-Decode_Layer_2/biases/summaries/stddev/SquareSquare*Decode_Layer_2/biases/summaries/stddev/sub*
_output_shapes
:*
T0
v
,Decode_Layer_2/biases/summaries/stddev/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ю
+Decode_Layer_2/biases/summaries/stddev/MeanMean-Decode_Layer_2/biases/summaries/stddev/Square,Decode_Layer_2/biases/summaries/stddev/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

+Decode_Layer_2/biases/summaries/stddev/SqrtSqrt+Decode_Layer_2/biases/summaries/stddev/Mean*
_output_shapes
: *
T0

-Decode_Layer_2/biases/summaries/stddev_1/tagsConst*
dtype0*
_output_shapes
: *9
value0B. B(Decode_Layer_2/biases/summaries/stddev_1
Ж
(Decode_Layer_2/biases/summaries/stddev_1ScalarSummary-Decode_Layer_2/biases/summaries/stddev_1/tags+Decode_Layer_2/biases/summaries/stddev/Sqrt*
_output_shapes
: *
T0
h
&Decode_Layer_2/biases/summaries/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
o
-Decode_Layer_2/biases/summaries/range_1/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Decode_Layer_2/biases/summaries/range_1/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Decode_Layer_2/biases/summaries/range_1Range-Decode_Layer_2/biases/summaries/range_1/start&Decode_Layer_2/biases/summaries/Rank_1-Decode_Layer_2/biases/summaries/range_1/delta*

Tidx0*
_output_shapes
:

#Decode_Layer_2/biases/summaries/MaxMaxbias_3/read'Decode_Layer_2/biases/summaries/range_1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Decode_Layer_2/biases/summaries/max/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Decode_Layer_2/biases/summaries/max
Є
#Decode_Layer_2/biases/summaries/maxScalarSummary(Decode_Layer_2/biases/summaries/max/tags#Decode_Layer_2/biases/summaries/Max*
_output_shapes
: *
T0
h
&Decode_Layer_2/biases/summaries/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
o
-Decode_Layer_2/biases/summaries/range_2/startConst*
dtype0*
_output_shapes
: *
value	B : 
o
-Decode_Layer_2/biases/summaries/range_2/deltaConst*
dtype0*
_output_shapes
: *
value	B :
о
'Decode_Layer_2/biases/summaries/range_2Range-Decode_Layer_2/biases/summaries/range_2/start&Decode_Layer_2/biases/summaries/Rank_2-Decode_Layer_2/biases/summaries/range_2/delta*

Tidx0*
_output_shapes
:

#Decode_Layer_2/biases/summaries/MinMinbias_3/read'Decode_Layer_2/biases/summaries/range_2*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 

(Decode_Layer_2/biases/summaries/min/tagsConst*
dtype0*
_output_shapes
: *4
value+B) B#Decode_Layer_2/biases/summaries/min
Є
#Decode_Layer_2/biases/summaries/minScalarSummary(Decode_Layer_2/biases/summaries/min/tags#Decode_Layer_2/biases/summaries/Min*
_output_shapes
: *
T0

-Decode_Layer_2/biases/summaries/histogram/tagConst*
dtype0*
_output_shapes
: *:
value1B/ B)Decode_Layer_2/biases/summaries/histogram

)Decode_Layer_2/biases/summaries/histogramHistogramSummary-Decode_Layer_2/biases/summaries/histogram/tagbias_3/read*
_output_shapes
: *
T0
p
accuracy/subSubInput/PlaceholderDecode_Layer_2/Sigmoid*'
_output_shapes
:џџџџџџџџџ*
T0
S
accuracy/Pow/yConst*
dtype0*
_output_shapes
: *
valueB
 *   @
c
accuracy/PowPowaccuracy/subaccuracy/Pow/y*'
_output_shapes
:џџџџџџџџџ*
T0
_
accuracy/ConstConst*
dtype0*
_output_shapes
:*
valueB"       
q
accuracy/MeanMeanaccuracy/Powaccuracy/Const*
	keep_dims( *

Tidx0*
T0*
_output_shapes
: 
[
accuracy/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
]
accuracy/gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  ?
t
accuracy/gradients/FillFillaccuracy/gradients/Shapeaccuracy/gradients/Const*
_output_shapes
: *
T0

3accuracy/gradients/accuracy/Mean_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB"      
Н
-accuracy/gradients/accuracy/Mean_grad/ReshapeReshapeaccuracy/gradients/Fill3accuracy/gradients/accuracy/Mean_grad/Reshape/shape*
T0*
Tshape0*
_output_shapes

:
w
+accuracy/gradients/accuracy/Mean_grad/ShapeShapeaccuracy/Pow*
out_type0*
_output_shapes
:*
T0
в
*accuracy/gradients/accuracy/Mean_grad/TileTile-accuracy/gradients/accuracy/Mean_grad/Reshape+accuracy/gradients/accuracy/Mean_grad/Shape*

Tmultiples0*
T0*'
_output_shapes
:џџџџџџџџџ
y
-accuracy/gradients/accuracy/Mean_grad/Shape_1Shapeaccuracy/Pow*
out_type0*
_output_shapes
:*
T0
p
-accuracy/gradients/accuracy/Mean_grad/Shape_2Const*
dtype0*
_output_shapes
: *
valueB 
З
+accuracy/gradients/accuracy/Mean_grad/ConstConst*@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*
dtype0*
_output_shapes
:*
valueB: 

*accuracy/gradients/accuracy/Mean_grad/ProdProd-accuracy/gradients/accuracy/Mean_grad/Shape_1+accuracy/gradients/accuracy/Mean_grad/Const*
	keep_dims( *@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*

Tidx0*
T0*
_output_shapes
: 
Й
-accuracy/gradients/accuracy/Mean_grad/Const_1Const*@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*
dtype0*
_output_shapes
:*
valueB: 

,accuracy/gradients/accuracy/Mean_grad/Prod_1Prod-accuracy/gradients/accuracy/Mean_grad/Shape_2-accuracy/gradients/accuracy/Mean_grad/Const_1*
	keep_dims( *@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*

Tidx0*
T0*
_output_shapes
: 
Г
/accuracy/gradients/accuracy/Mean_grad/Maximum/yConst*@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*
dtype0*
_output_shapes
: *
value	B :
њ
-accuracy/gradients/accuracy/Mean_grad/MaximumMaximum,accuracy/gradients/accuracy/Mean_grad/Prod_1/accuracy/gradients/accuracy/Mean_grad/Maximum/y*@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*
_output_shapes
: *
T0
ј
.accuracy/gradients/accuracy/Mean_grad/floordivFloorDiv*accuracy/gradients/accuracy/Mean_grad/Prod-accuracy/gradients/accuracy/Mean_grad/Maximum*@
_class6
42loc:@accuracy/gradients/accuracy/Mean_grad/Shape_1*
_output_shapes
: *
T0

*accuracy/gradients/accuracy/Mean_grad/CastCast.accuracy/gradients/accuracy/Mean_grad/floordiv*

SrcT0*

DstT0*
_output_shapes
: 
Т
-accuracy/gradients/accuracy/Mean_grad/truedivRealDiv*accuracy/gradients/accuracy/Mean_grad/Tile*accuracy/gradients/accuracy/Mean_grad/Cast*'
_output_shapes
:џџџџџџџџџ*
T0
v
*accuracy/gradients/accuracy/Pow_grad/ShapeShapeaccuracy/sub*
out_type0*
_output_shapes
:*
T0
o
,accuracy/gradients/accuracy/Pow_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
ъ
:accuracy/gradients/accuracy/Pow_grad/BroadcastGradientArgsBroadcastGradientArgs*accuracy/gradients/accuracy/Pow_grad/Shape,accuracy/gradients/accuracy/Pow_grad/Shape_1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0
 
(accuracy/gradients/accuracy/Pow_grad/mulMul-accuracy/gradients/accuracy/Mean_grad/truedivaccuracy/Pow/y*'
_output_shapes
:џџџџџџџџџ*
T0
o
*accuracy/gradients/accuracy/Pow_grad/sub/yConst*
dtype0*
_output_shapes
: *
valueB
 *  ?

(accuracy/gradients/accuracy/Pow_grad/subSubaccuracy/Pow/y*accuracy/gradients/accuracy/Pow_grad/sub/y*
_output_shapes
: *
T0

(accuracy/gradients/accuracy/Pow_grad/PowPowaccuracy/sub(accuracy/gradients/accuracy/Pow_grad/sub*'
_output_shapes
:џџџџџџџџџ*
T0
З
*accuracy/gradients/accuracy/Pow_grad/mul_1Mul(accuracy/gradients/accuracy/Pow_grad/mul(accuracy/gradients/accuracy/Pow_grad/Pow*'
_output_shapes
:џџџџџџџџџ*
T0
з
(accuracy/gradients/accuracy/Pow_grad/SumSum*accuracy/gradients/accuracy/Pow_grad/mul_1:accuracy/gradients/accuracy/Pow_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Э
,accuracy/gradients/accuracy/Pow_grad/ReshapeReshape(accuracy/gradients/accuracy/Pow_grad/Sum*accuracy/gradients/accuracy/Pow_grad/Shape*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
s
.accuracy/gradients/accuracy/Pow_grad/Greater/yConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ї
,accuracy/gradients/accuracy/Pow_grad/GreaterGreateraccuracy/sub.accuracy/gradients/accuracy/Pow_grad/Greater/y*'
_output_shapes
:џџџџџџџџџ*
T0
o
(accuracy/gradients/accuracy/Pow_grad/LogLogaccuracy/sub*'
_output_shapes
:џџџџџџџџџ*
T0
|
/accuracy/gradients/accuracy/Pow_grad/zeros_like	ZerosLikeaccuracy/sub*'
_output_shapes
:џџџџџџџџџ*
T0
№
+accuracy/gradients/accuracy/Pow_grad/SelectSelect,accuracy/gradients/accuracy/Pow_grad/Greater(accuracy/gradients/accuracy/Pow_grad/Log/accuracy/gradients/accuracy/Pow_grad/zeros_like*'
_output_shapes
:џџџџџџџџџ*
T0
 
*accuracy/gradients/accuracy/Pow_grad/mul_2Mul-accuracy/gradients/accuracy/Mean_grad/truedivaccuracy/Pow*'
_output_shapes
:џџџџџџџџџ*
T0
М
*accuracy/gradients/accuracy/Pow_grad/mul_3Mul*accuracy/gradients/accuracy/Pow_grad/mul_2+accuracy/gradients/accuracy/Pow_grad/Select*'
_output_shapes
:џџџџџџџџџ*
T0
л
*accuracy/gradients/accuracy/Pow_grad/Sum_1Sum*accuracy/gradients/accuracy/Pow_grad/mul_3<accuracy/gradients/accuracy/Pow_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Т
.accuracy/gradients/accuracy/Pow_grad/Reshape_1Reshape*accuracy/gradients/accuracy/Pow_grad/Sum_1,accuracy/gradients/accuracy/Pow_grad/Shape_1*
T0*
Tshape0*
_output_shapes
: 

5accuracy/gradients/accuracy/Pow_grad/tuple/group_depsNoOp-^accuracy/gradients/accuracy/Pow_grad/Reshape/^accuracy/gradients/accuracy/Pow_grad/Reshape_1
Ђ
=accuracy/gradients/accuracy/Pow_grad/tuple/control_dependencyIdentity,accuracy/gradients/accuracy/Pow_grad/Reshape6^accuracy/gradients/accuracy/Pow_grad/tuple/group_deps*?
_class5
31loc:@accuracy/gradients/accuracy/Pow_grad/Reshape*'
_output_shapes
:џџџџџџџџџ*
T0

?accuracy/gradients/accuracy/Pow_grad/tuple/control_dependency_1Identity.accuracy/gradients/accuracy/Pow_grad/Reshape_16^accuracy/gradients/accuracy/Pow_grad/tuple/group_deps*A
_class7
53loc:@accuracy/gradients/accuracy/Pow_grad/Reshape_1*
_output_shapes
: *
T0
{
*accuracy/gradients/accuracy/sub_grad/ShapeShapeInput/Placeholder*
out_type0*
_output_shapes
:*
T0

,accuracy/gradients/accuracy/sub_grad/Shape_1ShapeDecode_Layer_2/Sigmoid*
out_type0*
_output_shapes
:*
T0
ъ
:accuracy/gradients/accuracy/sub_grad/BroadcastGradientArgsBroadcastGradientArgs*accuracy/gradients/accuracy/sub_grad/Shape,accuracy/gradients/accuracy/sub_grad/Shape_1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0
ъ
(accuracy/gradients/accuracy/sub_grad/SumSum=accuracy/gradients/accuracy/Pow_grad/tuple/control_dependency:accuracy/gradients/accuracy/sub_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
Э
,accuracy/gradients/accuracy/sub_grad/ReshapeReshape(accuracy/gradients/accuracy/sub_grad/Sum*accuracy/gradients/accuracy/sub_grad/Shape*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ю
*accuracy/gradients/accuracy/sub_grad/Sum_1Sum=accuracy/gradients/accuracy/Pow_grad/tuple/control_dependency<accuracy/gradients/accuracy/sub_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
~
(accuracy/gradients/accuracy/sub_grad/NegNeg*accuracy/gradients/accuracy/sub_grad/Sum_1*
_output_shapes
:*
T0
б
.accuracy/gradients/accuracy/sub_grad/Reshape_1Reshape(accuracy/gradients/accuracy/sub_grad/Neg,accuracy/gradients/accuracy/sub_grad/Shape_1*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ

5accuracy/gradients/accuracy/sub_grad/tuple/group_depsNoOp-^accuracy/gradients/accuracy/sub_grad/Reshape/^accuracy/gradients/accuracy/sub_grad/Reshape_1
Ђ
=accuracy/gradients/accuracy/sub_grad/tuple/control_dependencyIdentity,accuracy/gradients/accuracy/sub_grad/Reshape6^accuracy/gradients/accuracy/sub_grad/tuple/group_deps*?
_class5
31loc:@accuracy/gradients/accuracy/sub_grad/Reshape*'
_output_shapes
:џџџџџџџџџ*
T0
Ј
?accuracy/gradients/accuracy/sub_grad/tuple/control_dependency_1Identity.accuracy/gradients/accuracy/sub_grad/Reshape_16^accuracy/gradients/accuracy/sub_grad/tuple/group_deps*A
_class7
53loc:@accuracy/gradients/accuracy/sub_grad/Reshape_1*'
_output_shapes
:џџџџџџџџџ*
T0
д
:accuracy/gradients/Decode_Layer_2/Sigmoid_grad/SigmoidGradSigmoidGradDecode_Layer_2/Sigmoid?accuracy/gradients/accuracy/sub_grad/tuple/control_dependency_1*'
_output_shapes
:џџџџџџџџџ*
T0

0accuracy/gradients/Decode_Layer_2/Add_grad/ShapeShapeDecode_Layer_2/MatMul*
out_type0*
_output_shapes
:*
T0
|
2accuracy/gradients/Decode_Layer_2/Add_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ќ
@accuracy/gradients/Decode_Layer_2/Add_grad/BroadcastGradientArgsBroadcastGradientArgs0accuracy/gradients/Decode_Layer_2/Add_grad/Shape2accuracy/gradients/Decode_Layer_2/Add_grad/Shape_1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0
ѓ
.accuracy/gradients/Decode_Layer_2/Add_grad/SumSum:accuracy/gradients/Decode_Layer_2/Sigmoid_grad/SigmoidGrad@accuracy/gradients/Decode_Layer_2/Add_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
п
2accuracy/gradients/Decode_Layer_2/Add_grad/ReshapeReshape.accuracy/gradients/Decode_Layer_2/Add_grad/Sum0accuracy/gradients/Decode_Layer_2/Add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ї
0accuracy/gradients/Decode_Layer_2/Add_grad/Sum_1Sum:accuracy/gradients/Decode_Layer_2/Sigmoid_grad/SigmoidGradBaccuracy/gradients/Decode_Layer_2/Add_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
и
4accuracy/gradients/Decode_Layer_2/Add_grad/Reshape_1Reshape0accuracy/gradients/Decode_Layer_2/Add_grad/Sum_12accuracy/gradients/Decode_Layer_2/Add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Џ
;accuracy/gradients/Decode_Layer_2/Add_grad/tuple/group_depsNoOp3^accuracy/gradients/Decode_Layer_2/Add_grad/Reshape5^accuracy/gradients/Decode_Layer_2/Add_grad/Reshape_1
К
Caccuracy/gradients/Decode_Layer_2/Add_grad/tuple/control_dependencyIdentity2accuracy/gradients/Decode_Layer_2/Add_grad/Reshape<^accuracy/gradients/Decode_Layer_2/Add_grad/tuple/group_deps*E
_class;
97loc:@accuracy/gradients/Decode_Layer_2/Add_grad/Reshape*'
_output_shapes
:џџџџџџџџџ*
T0
Г
Eaccuracy/gradients/Decode_Layer_2/Add_grad/tuple/control_dependency_1Identity4accuracy/gradients/Decode_Layer_2/Add_grad/Reshape_1<^accuracy/gradients/Decode_Layer_2/Add_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Decode_Layer_2/Add_grad/Reshape_1*
_output_shapes
:*
T0
ъ
4accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMulMatMulCaccuracy/gradients/Decode_Layer_2/Add_grad/tuple/control_dependencyweight_3/read*
transpose_a( *
transpose_b(*'
_output_shapes
:џџџџџџџџџ*
T0
ь
6accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul_1MatMulDecode_Layer_1/SigmoidCaccuracy/gradients/Decode_Layer_2/Add_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
_output_shapes

:*
T0
Ж
>accuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/group_depsNoOp5^accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul7^accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul_1
Ф
Faccuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/control_dependencyIdentity4accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul?^accuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul*'
_output_shapes
:џџџџџџџџџ*
T0
С
Haccuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/control_dependency_1Identity6accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul_1?^accuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/group_deps*I
_class?
=;loc:@accuracy/gradients/Decode_Layer_2/MatMul_grad/MatMul_1*
_output_shapes

:*
T0
л
:accuracy/gradients/Decode_Layer_1/Sigmoid_grad/SigmoidGradSigmoidGradDecode_Layer_1/SigmoidFaccuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/control_dependency*'
_output_shapes
:џџџџџџџџџ*
T0

0accuracy/gradients/Decode_Layer_1/Add_grad/ShapeShapeDecode_Layer_1/MatMul*
out_type0*
_output_shapes
:*
T0
|
2accuracy/gradients/Decode_Layer_1/Add_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ќ
@accuracy/gradients/Decode_Layer_1/Add_grad/BroadcastGradientArgsBroadcastGradientArgs0accuracy/gradients/Decode_Layer_1/Add_grad/Shape2accuracy/gradients/Decode_Layer_1/Add_grad/Shape_1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0
ѓ
.accuracy/gradients/Decode_Layer_1/Add_grad/SumSum:accuracy/gradients/Decode_Layer_1/Sigmoid_grad/SigmoidGrad@accuracy/gradients/Decode_Layer_1/Add_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
п
2accuracy/gradients/Decode_Layer_1/Add_grad/ReshapeReshape.accuracy/gradients/Decode_Layer_1/Add_grad/Sum0accuracy/gradients/Decode_Layer_1/Add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ї
0accuracy/gradients/Decode_Layer_1/Add_grad/Sum_1Sum:accuracy/gradients/Decode_Layer_1/Sigmoid_grad/SigmoidGradBaccuracy/gradients/Decode_Layer_1/Add_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
и
4accuracy/gradients/Decode_Layer_1/Add_grad/Reshape_1Reshape0accuracy/gradients/Decode_Layer_1/Add_grad/Sum_12accuracy/gradients/Decode_Layer_1/Add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Џ
;accuracy/gradients/Decode_Layer_1/Add_grad/tuple/group_depsNoOp3^accuracy/gradients/Decode_Layer_1/Add_grad/Reshape5^accuracy/gradients/Decode_Layer_1/Add_grad/Reshape_1
К
Caccuracy/gradients/Decode_Layer_1/Add_grad/tuple/control_dependencyIdentity2accuracy/gradients/Decode_Layer_1/Add_grad/Reshape<^accuracy/gradients/Decode_Layer_1/Add_grad/tuple/group_deps*E
_class;
97loc:@accuracy/gradients/Decode_Layer_1/Add_grad/Reshape*'
_output_shapes
:џџџџџџџџџ*
T0
Г
Eaccuracy/gradients/Decode_Layer_1/Add_grad/tuple/control_dependency_1Identity4accuracy/gradients/Decode_Layer_1/Add_grad/Reshape_1<^accuracy/gradients/Decode_Layer_1/Add_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Decode_Layer_1/Add_grad/Reshape_1*
_output_shapes
:*
T0
ъ
4accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMulMatMulCaccuracy/gradients/Decode_Layer_1/Add_grad/tuple/control_dependencyweight_2/read*
transpose_a( *
transpose_b(*'
_output_shapes
:џџџџџџџџџ*
T0
ь
6accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul_1MatMulEncode_Layer_2/SigmoidCaccuracy/gradients/Decode_Layer_1/Add_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
_output_shapes

:*
T0
Ж
>accuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/group_depsNoOp5^accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul7^accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul_1
Ф
Faccuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/control_dependencyIdentity4accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul?^accuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul*'
_output_shapes
:џџџџџџџџџ*
T0
С
Haccuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/control_dependency_1Identity6accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul_1?^accuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/group_deps*I
_class?
=;loc:@accuracy/gradients/Decode_Layer_1/MatMul_grad/MatMul_1*
_output_shapes

:*
T0
л
:accuracy/gradients/Encode_Layer_2/Sigmoid_grad/SigmoidGradSigmoidGradEncode_Layer_2/SigmoidFaccuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/control_dependency*'
_output_shapes
:џџџџџџџџџ*
T0

0accuracy/gradients/Encode_Layer_2/Add_grad/ShapeShapeEncode_Layer_2/MatMul*
out_type0*
_output_shapes
:*
T0
|
2accuracy/gradients/Encode_Layer_2/Add_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ќ
@accuracy/gradients/Encode_Layer_2/Add_grad/BroadcastGradientArgsBroadcastGradientArgs0accuracy/gradients/Encode_Layer_2/Add_grad/Shape2accuracy/gradients/Encode_Layer_2/Add_grad/Shape_1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0
ѓ
.accuracy/gradients/Encode_Layer_2/Add_grad/SumSum:accuracy/gradients/Encode_Layer_2/Sigmoid_grad/SigmoidGrad@accuracy/gradients/Encode_Layer_2/Add_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
п
2accuracy/gradients/Encode_Layer_2/Add_grad/ReshapeReshape.accuracy/gradients/Encode_Layer_2/Add_grad/Sum0accuracy/gradients/Encode_Layer_2/Add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ї
0accuracy/gradients/Encode_Layer_2/Add_grad/Sum_1Sum:accuracy/gradients/Encode_Layer_2/Sigmoid_grad/SigmoidGradBaccuracy/gradients/Encode_Layer_2/Add_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
и
4accuracy/gradients/Encode_Layer_2/Add_grad/Reshape_1Reshape0accuracy/gradients/Encode_Layer_2/Add_grad/Sum_12accuracy/gradients/Encode_Layer_2/Add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Џ
;accuracy/gradients/Encode_Layer_2/Add_grad/tuple/group_depsNoOp3^accuracy/gradients/Encode_Layer_2/Add_grad/Reshape5^accuracy/gradients/Encode_Layer_2/Add_grad/Reshape_1
К
Caccuracy/gradients/Encode_Layer_2/Add_grad/tuple/control_dependencyIdentity2accuracy/gradients/Encode_Layer_2/Add_grad/Reshape<^accuracy/gradients/Encode_Layer_2/Add_grad/tuple/group_deps*E
_class;
97loc:@accuracy/gradients/Encode_Layer_2/Add_grad/Reshape*'
_output_shapes
:џџџџџџџџџ*
T0
Г
Eaccuracy/gradients/Encode_Layer_2/Add_grad/tuple/control_dependency_1Identity4accuracy/gradients/Encode_Layer_2/Add_grad/Reshape_1<^accuracy/gradients/Encode_Layer_2/Add_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Encode_Layer_2/Add_grad/Reshape_1*
_output_shapes
:*
T0
ъ
4accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMulMatMulCaccuracy/gradients/Encode_Layer_2/Add_grad/tuple/control_dependencyweight_1/read*
transpose_a( *
transpose_b(*'
_output_shapes
:џџџџџџџџџ*
T0
ь
6accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul_1MatMulEncode_Layer_1/SigmoidCaccuracy/gradients/Encode_Layer_2/Add_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
_output_shapes

:*
T0
Ж
>accuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/group_depsNoOp5^accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul7^accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul_1
Ф
Faccuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/control_dependencyIdentity4accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul?^accuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul*'
_output_shapes
:џџџџџџџџџ*
T0
С
Haccuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/control_dependency_1Identity6accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul_1?^accuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/group_deps*I
_class?
=;loc:@accuracy/gradients/Encode_Layer_2/MatMul_grad/MatMul_1*
_output_shapes

:*
T0
л
:accuracy/gradients/Encode_Layer_1/Sigmoid_grad/SigmoidGradSigmoidGradEncode_Layer_1/SigmoidFaccuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/control_dependency*'
_output_shapes
:џџџџџџџџџ*
T0

0accuracy/gradients/Encode_Layer_1/Add_grad/ShapeShapeEncode_Layer_1/MatMul*
out_type0*
_output_shapes
:*
T0
|
2accuracy/gradients/Encode_Layer_1/Add_grad/Shape_1Const*
dtype0*
_output_shapes
:*
valueB:
ќ
@accuracy/gradients/Encode_Layer_1/Add_grad/BroadcastGradientArgsBroadcastGradientArgs0accuracy/gradients/Encode_Layer_1/Add_grad/Shape2accuracy/gradients/Encode_Layer_1/Add_grad/Shape_1*2
_output_shapes 
:џџџџџџџџџ:џџџџџџџџџ*
T0
ѓ
.accuracy/gradients/Encode_Layer_1/Add_grad/SumSum:accuracy/gradients/Encode_Layer_1/Sigmoid_grad/SigmoidGrad@accuracy/gradients/Encode_Layer_1/Add_grad/BroadcastGradientArgs*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
п
2accuracy/gradients/Encode_Layer_1/Add_grad/ReshapeReshape.accuracy/gradients/Encode_Layer_1/Add_grad/Sum0accuracy/gradients/Encode_Layer_1/Add_grad/Shape*
T0*
Tshape0*'
_output_shapes
:џџџџџџџџџ
ї
0accuracy/gradients/Encode_Layer_1/Add_grad/Sum_1Sum:accuracy/gradients/Encode_Layer_1/Sigmoid_grad/SigmoidGradBaccuracy/gradients/Encode_Layer_1/Add_grad/BroadcastGradientArgs:1*
	keep_dims( *

Tidx0*
T0*
_output_shapes
:
и
4accuracy/gradients/Encode_Layer_1/Add_grad/Reshape_1Reshape0accuracy/gradients/Encode_Layer_1/Add_grad/Sum_12accuracy/gradients/Encode_Layer_1/Add_grad/Shape_1*
T0*
Tshape0*
_output_shapes
:
Џ
;accuracy/gradients/Encode_Layer_1/Add_grad/tuple/group_depsNoOp3^accuracy/gradients/Encode_Layer_1/Add_grad/Reshape5^accuracy/gradients/Encode_Layer_1/Add_grad/Reshape_1
К
Caccuracy/gradients/Encode_Layer_1/Add_grad/tuple/control_dependencyIdentity2accuracy/gradients/Encode_Layer_1/Add_grad/Reshape<^accuracy/gradients/Encode_Layer_1/Add_grad/tuple/group_deps*E
_class;
97loc:@accuracy/gradients/Encode_Layer_1/Add_grad/Reshape*'
_output_shapes
:џџџџџџџџџ*
T0
Г
Eaccuracy/gradients/Encode_Layer_1/Add_grad/tuple/control_dependency_1Identity4accuracy/gradients/Encode_Layer_1/Add_grad/Reshape_1<^accuracy/gradients/Encode_Layer_1/Add_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Encode_Layer_1/Add_grad/Reshape_1*
_output_shapes
:*
T0
ш
4accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMulMatMulCaccuracy/gradients/Encode_Layer_1/Add_grad/tuple/control_dependencyweight/read*
transpose_a( *
transpose_b(*'
_output_shapes
:џџџџџџџџџ*
T0
ч
6accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul_1MatMulInput/PlaceholderCaccuracy/gradients/Encode_Layer_1/Add_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
_output_shapes

:*
T0
Ж
>accuracy/gradients/Encode_Layer_1/MatMul_grad/tuple/group_depsNoOp5^accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul7^accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul_1
Ф
Faccuracy/gradients/Encode_Layer_1/MatMul_grad/tuple/control_dependencyIdentity4accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul?^accuracy/gradients/Encode_Layer_1/MatMul_grad/tuple/group_deps*G
_class=
;9loc:@accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul*'
_output_shapes
:џџџџџџџџџ*
T0
С
Haccuracy/gradients/Encode_Layer_1/MatMul_grad/tuple/control_dependency_1Identity6accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul_1?^accuracy/gradients/Encode_Layer_1/MatMul_grad/tuple/group_deps*I
_class?
=;loc:@accuracy/gradients/Encode_Layer_1/MatMul_grad/MatMul_1*
_output_shapes

:*
T0

weight/RMSProp/Initializer/onesConst*
_class
loc:@weight*
dtype0*
_output_shapes

:*
valueB*  ?

weight/RMSProp
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight*
	container *
shared_name 
Н
weight/RMSProp/AssignAssignweight/RMSPropweight/RMSProp/Initializer/ones*
_class
loc:@weight*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
s
weight/RMSProp/readIdentityweight/RMSProp*
_class
loc:@weight*
_output_shapes

:*
T0

"weight/RMSProp_1/Initializer/zerosConst*
_class
loc:@weight*
dtype0*
_output_shapes

:*
valueB*    

weight/RMSProp_1
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight*
	container *
shared_name 
Ф
weight/RMSProp_1/AssignAssignweight/RMSProp_1"weight/RMSProp_1/Initializer/zeros*
_class
loc:@weight*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
w
weight/RMSProp_1/readIdentityweight/RMSProp_1*
_class
loc:@weight*
_output_shapes

:*
T0

!weight_1/RMSProp/Initializer/onesConst*
_class
loc:@weight_1*
dtype0*
_output_shapes

:*
valueB*  ?
Ё
weight_1/RMSProp
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight_1*
	container *
shared_name 
Х
weight_1/RMSProp/AssignAssignweight_1/RMSProp!weight_1/RMSProp/Initializer/ones*
_class
loc:@weight_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
y
weight_1/RMSProp/readIdentityweight_1/RMSProp*
_class
loc:@weight_1*
_output_shapes

:*
T0

$weight_1/RMSProp_1/Initializer/zerosConst*
_class
loc:@weight_1*
dtype0*
_output_shapes

:*
valueB*    
Ѓ
weight_1/RMSProp_1
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight_1*
	container *
shared_name 
Ь
weight_1/RMSProp_1/AssignAssignweight_1/RMSProp_1$weight_1/RMSProp_1/Initializer/zeros*
_class
loc:@weight_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
}
weight_1/RMSProp_1/readIdentityweight_1/RMSProp_1*
_class
loc:@weight_1*
_output_shapes

:*
T0

!weight_2/RMSProp/Initializer/onesConst*
_class
loc:@weight_2*
dtype0*
_output_shapes

:*
valueB*  ?
Ё
weight_2/RMSProp
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight_2*
	container *
shared_name 
Х
weight_2/RMSProp/AssignAssignweight_2/RMSProp!weight_2/RMSProp/Initializer/ones*
_class
loc:@weight_2*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
y
weight_2/RMSProp/readIdentityweight_2/RMSProp*
_class
loc:@weight_2*
_output_shapes

:*
T0

$weight_2/RMSProp_1/Initializer/zerosConst*
_class
loc:@weight_2*
dtype0*
_output_shapes

:*
valueB*    
Ѓ
weight_2/RMSProp_1
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight_2*
	container *
shared_name 
Ь
weight_2/RMSProp_1/AssignAssignweight_2/RMSProp_1$weight_2/RMSProp_1/Initializer/zeros*
_class
loc:@weight_2*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
}
weight_2/RMSProp_1/readIdentityweight_2/RMSProp_1*
_class
loc:@weight_2*
_output_shapes

:*
T0

!weight_3/RMSProp/Initializer/onesConst*
_class
loc:@weight_3*
dtype0*
_output_shapes

:*
valueB*  ?
Ё
weight_3/RMSProp
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight_3*
	container *
shared_name 
Х
weight_3/RMSProp/AssignAssignweight_3/RMSProp!weight_3/RMSProp/Initializer/ones*
_class
loc:@weight_3*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
y
weight_3/RMSProp/readIdentityweight_3/RMSProp*
_class
loc:@weight_3*
_output_shapes

:*
T0

$weight_3/RMSProp_1/Initializer/zerosConst*
_class
loc:@weight_3*
dtype0*
_output_shapes

:*
valueB*    
Ѓ
weight_3/RMSProp_1
VariableV2*
dtype0*
shape
:*
_output_shapes

:*
_class
loc:@weight_3*
	container *
shared_name 
Ь
weight_3/RMSProp_1/AssignAssignweight_3/RMSProp_1$weight_3/RMSProp_1/Initializer/zeros*
_class
loc:@weight_3*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
}
weight_3/RMSProp_1/readIdentityweight_3/RMSProp_1*
_class
loc:@weight_3*
_output_shapes

:*
T0

bias/RMSProp/Initializer/onesConst*
_class
	loc:@bias*
dtype0*
_output_shapes
:*
valueB*  ?

bias/RMSProp
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
	loc:@bias*
	container *
shared_name 
Б
bias/RMSProp/AssignAssignbias/RMSPropbias/RMSProp/Initializer/ones*
_class
	loc:@bias*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
i
bias/RMSProp/readIdentitybias/RMSProp*
_class
	loc:@bias*
_output_shapes
:*
T0

 bias/RMSProp_1/Initializer/zerosConst*
_class
	loc:@bias*
dtype0*
_output_shapes
:*
valueB*    

bias/RMSProp_1
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
	loc:@bias*
	container *
shared_name 
И
bias/RMSProp_1/AssignAssignbias/RMSProp_1 bias/RMSProp_1/Initializer/zeros*
_class
	loc:@bias*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
m
bias/RMSProp_1/readIdentitybias/RMSProp_1*
_class
	loc:@bias*
_output_shapes
:*
T0

bias_1/RMSProp/Initializer/onesConst*
_class
loc:@bias_1*
dtype0*
_output_shapes
:*
valueB*  ?

bias_1/RMSProp
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
loc:@bias_1*
	container *
shared_name 
Й
bias_1/RMSProp/AssignAssignbias_1/RMSPropbias_1/RMSProp/Initializer/ones*
_class
loc:@bias_1*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
o
bias_1/RMSProp/readIdentitybias_1/RMSProp*
_class
loc:@bias_1*
_output_shapes
:*
T0

"bias_1/RMSProp_1/Initializer/zerosConst*
_class
loc:@bias_1*
dtype0*
_output_shapes
:*
valueB*    

bias_1/RMSProp_1
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
loc:@bias_1*
	container *
shared_name 
Р
bias_1/RMSProp_1/AssignAssignbias_1/RMSProp_1"bias_1/RMSProp_1/Initializer/zeros*
_class
loc:@bias_1*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
s
bias_1/RMSProp_1/readIdentitybias_1/RMSProp_1*
_class
loc:@bias_1*
_output_shapes
:*
T0

bias_2/RMSProp/Initializer/onesConst*
_class
loc:@bias_2*
dtype0*
_output_shapes
:*
valueB*  ?

bias_2/RMSProp
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
loc:@bias_2*
	container *
shared_name 
Й
bias_2/RMSProp/AssignAssignbias_2/RMSPropbias_2/RMSProp/Initializer/ones*
_class
loc:@bias_2*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
o
bias_2/RMSProp/readIdentitybias_2/RMSProp*
_class
loc:@bias_2*
_output_shapes
:*
T0

"bias_2/RMSProp_1/Initializer/zerosConst*
_class
loc:@bias_2*
dtype0*
_output_shapes
:*
valueB*    

bias_2/RMSProp_1
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
loc:@bias_2*
	container *
shared_name 
Р
bias_2/RMSProp_1/AssignAssignbias_2/RMSProp_1"bias_2/RMSProp_1/Initializer/zeros*
_class
loc:@bias_2*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
s
bias_2/RMSProp_1/readIdentitybias_2/RMSProp_1*
_class
loc:@bias_2*
_output_shapes
:*
T0

bias_3/RMSProp/Initializer/onesConst*
_class
loc:@bias_3*
dtype0*
_output_shapes
:*
valueB*  ?

bias_3/RMSProp
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
loc:@bias_3*
	container *
shared_name 
Й
bias_3/RMSProp/AssignAssignbias_3/RMSPropbias_3/RMSProp/Initializer/ones*
_class
loc:@bias_3*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
o
bias_3/RMSProp/readIdentitybias_3/RMSProp*
_class
loc:@bias_3*
_output_shapes
:*
T0

"bias_3/RMSProp_1/Initializer/zerosConst*
_class
loc:@bias_3*
dtype0*
_output_shapes
:*
valueB*    

bias_3/RMSProp_1
VariableV2*
dtype0*
shape:*
_output_shapes
:*
_class
loc:@bias_3*
	container *
shared_name 
Р
bias_3/RMSProp_1/AssignAssignbias_3/RMSProp_1"bias_3/RMSProp_1/Initializer/zeros*
_class
loc:@bias_3*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
s
bias_3/RMSProp_1/readIdentitybias_3/RMSProp_1*
_class
loc:@bias_3*
_output_shapes
:*
T0
c
accuracy/RMSProp/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *ЭЬЬ=
[
accuracy/RMSProp/decayConst*
dtype0*
_output_shapes
: *
valueB
 *fff?
^
accuracy/RMSProp/momentumConst*
dtype0*
_output_shapes
: *
valueB
 *    
]
accuracy/RMSProp/epsilonConst*
dtype0*
_output_shapes
: *
valueB
 *џцл.
ѓ
+accuracy/RMSProp/update_weight/ApplyRMSPropApplyRMSPropweightweight/RMSPropweight/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonHaccuracy/gradients/Encode_Layer_1/MatMul_grad/tuple/control_dependency_1*
_class
loc:@weight*
use_locking( *
_output_shapes

:*
T0
§
-accuracy/RMSProp/update_weight_1/ApplyRMSPropApplyRMSPropweight_1weight_1/RMSPropweight_1/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonHaccuracy/gradients/Encode_Layer_2/MatMul_grad/tuple/control_dependency_1*
_class
loc:@weight_1*
use_locking( *
_output_shapes

:*
T0
§
-accuracy/RMSProp/update_weight_2/ApplyRMSPropApplyRMSPropweight_2weight_2/RMSPropweight_2/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonHaccuracy/gradients/Decode_Layer_1/MatMul_grad/tuple/control_dependency_1*
_class
loc:@weight_2*
use_locking( *
_output_shapes

:*
T0
§
-accuracy/RMSProp/update_weight_3/ApplyRMSPropApplyRMSPropweight_3weight_3/RMSPropweight_3/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonHaccuracy/gradients/Decode_Layer_2/MatMul_grad/tuple/control_dependency_1*
_class
loc:@weight_3*
use_locking( *
_output_shapes

:*
T0
т
)accuracy/RMSProp/update_bias/ApplyRMSPropApplyRMSPropbiasbias/RMSPropbias/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonEaccuracy/gradients/Encode_Layer_1/Add_grad/tuple/control_dependency_1*
_class
	loc:@bias*
use_locking( *
_output_shapes
:*
T0
ь
+accuracy/RMSProp/update_bias_1/ApplyRMSPropApplyRMSPropbias_1bias_1/RMSPropbias_1/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonEaccuracy/gradients/Encode_Layer_2/Add_grad/tuple/control_dependency_1*
_class
loc:@bias_1*
use_locking( *
_output_shapes
:*
T0
ь
+accuracy/RMSProp/update_bias_2/ApplyRMSPropApplyRMSPropbias_2bias_2/RMSPropbias_2/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonEaccuracy/gradients/Decode_Layer_1/Add_grad/tuple/control_dependency_1*
_class
loc:@bias_2*
use_locking( *
_output_shapes
:*
T0
ь
+accuracy/RMSProp/update_bias_3/ApplyRMSPropApplyRMSPropbias_3bias_3/RMSPropbias_3/RMSProp_1accuracy/RMSProp/learning_rateaccuracy/RMSProp/decayaccuracy/RMSProp/momentumaccuracy/RMSProp/epsilonEaccuracy/gradients/Decode_Layer_2/Add_grad/tuple/control_dependency_1*
_class
loc:@bias_3*
use_locking( *
_output_shapes
:*
T0

accuracy/RMSPropNoOp,^accuracy/RMSProp/update_weight/ApplyRMSProp.^accuracy/RMSProp/update_weight_1/ApplyRMSProp.^accuracy/RMSProp/update_weight_2/ApplyRMSProp.^accuracy/RMSProp/update_weight_3/ApplyRMSProp*^accuracy/RMSProp/update_bias/ApplyRMSProp,^accuracy/RMSProp/update_bias_1/ApplyRMSProp,^accuracy/RMSProp/update_bias_2/ApplyRMSProp,^accuracy/RMSProp/update_bias_3/ApplyRMSProp
h
training_accuracy/tagsConst*
dtype0*
_output_shapes
: *"
valueB Btraining_accuracy
j
training_accuracyScalarSummarytraining_accuracy/tagsaccuracy/Mean*
_output_shapes
: *
T0
Ј
initNoOp^weight/Assign^weight_1/Assign^weight_2/Assign^weight_3/Assign^bias/Assign^bias_1/Assign^bias_2/Assign^bias_3/Assign^weight/RMSProp/Assign^weight/RMSProp_1/Assign^weight_1/RMSProp/Assign^weight_1/RMSProp_1/Assign^weight_2/RMSProp/Assign^weight_2/RMSProp_1/Assign^weight_3/RMSProp/Assign^weight_3/RMSProp_1/Assign^bias/RMSProp/Assign^bias/RMSProp_1/Assign^bias_1/RMSProp/Assign^bias_1/RMSProp_1/Assign^bias_2/RMSProp/Assign^bias_2/RMSProp_1/Assign^bias_3/RMSProp/Assign^bias_3/RMSProp_1/Assign

Merge/MergeSummaryMergeSummary%Encode_Layer_1/weights/summaries/mean)Encode_Layer_1/weights/summaries/stddev_1$Encode_Layer_1/weights/summaries/max$Encode_Layer_1/weights/summaries/min*Encode_Layer_1/weights/summaries/histogram$Encode_Layer_1/biases/summaries/mean(Encode_Layer_1/biases/summaries/stddev_1#Encode_Layer_1/biases/summaries/max#Encode_Layer_1/biases/summaries/min)Encode_Layer_1/biases/summaries/histogram%Encode_Layer_2/weights/summaries/mean)Encode_Layer_2/weights/summaries/stddev_1$Encode_Layer_2/weights/summaries/max$Encode_Layer_2/weights/summaries/min*Encode_Layer_2/weights/summaries/histogram$Encode_Layer_2/biases/summaries/mean(Encode_Layer_2/biases/summaries/stddev_1#Encode_Layer_2/biases/summaries/max#Encode_Layer_2/biases/summaries/min)Encode_Layer_2/biases/summaries/histogram%Decode_Layer_1/weights/summaries/mean)Decode_Layer_1/weights/summaries/stddev_1$Decode_Layer_1/weights/summaries/max$Decode_Layer_1/weights/summaries/min*Decode_Layer_1/weights/summaries/histogram$Decode_Layer_1/biases/summaries/mean(Decode_Layer_1/biases/summaries/stddev_1#Decode_Layer_1/biases/summaries/max#Decode_Layer_1/biases/summaries/min)Decode_Layer_1/biases/summaries/histogram%Decode_Layer_2/weights/summaries/mean)Decode_Layer_2/weights/summaries/stddev_1$Decode_Layer_2/weights/summaries/max$Decode_Layer_2/weights/summaries/min*Decode_Layer_2/weights/summaries/histogram$Decode_Layer_2/biases/summaries/mean(Decode_Layer_2/biases/summaries/stddev_1#Decode_Layer_2/biases/summaries/max#Decode_Layer_2/biases/summaries/min)Decode_Layer_2/biases/summaries/histogramtraining_accuracy*
N)*
_output_shapes
: 

init_all_tablesNoOp
(
legacy_init_opNoOp^init_all_tables
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel

save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_63beaf49baa14f1b9aa90dcedbdf711d/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
\
save/ShardedFilename/shardConst*
dtype0*
_output_shapes
: *
value	B : 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
О
save/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*ё
valueчBфBbiasBbias/RMSPropBbias/RMSProp_1Bbias_1Bbias_1/RMSPropBbias_1/RMSProp_1Bbias_2Bbias_2/RMSPropBbias_2/RMSProp_1Bbias_3Bbias_3/RMSPropBbias_3/RMSProp_1BweightBweight/RMSPropBweight/RMSProp_1Bweight_1Bweight_1/RMSPropBweight_1/RMSProp_1Bweight_2Bweight_2/RMSPropBweight_2/RMSProp_1Bweight_3Bweight_3/RMSPropBweight_3/RMSProp_1

save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*C
value:B8B B B B B B B B B B B B B B B B B B B B B B B B 
ч
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbiasbias/RMSPropbias/RMSProp_1bias_1bias_1/RMSPropbias_1/RMSProp_1bias_2bias_2/RMSPropbias_2/RMSProp_1bias_3bias_3/RMSPropbias_3/RMSProp_1weightweight/RMSPropweight/RMSProp_1weight_1weight_1/RMSPropweight_1/RMSProp_1weight_2weight_2/RMSPropweight_2/RMSProp_1weight_3weight_3/RMSPropweight_3/RMSProp_1*&
dtypes
2

save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*'
_class
loc:@save/ShardedFilename*
_output_shapes
: *
T0

+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
N*
_output_shapes
:*
T0*

axis 
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
_output_shapes
: *
T0
h
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBbias
h
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2

save/AssignAssignbiassave/RestoreV2*
_class
	loc:@bias*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
r
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*!
valueBBbias/RMSProp
j
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2

save/Assign_1Assignbias/RMSPropsave/RestoreV2_1*
_class
	loc:@bias*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
t
save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*#
valueBBbias/RMSProp_1
j
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
 
save/Assign_2Assignbias/RMSProp_1save/RestoreV2_2*
_class
	loc:@bias*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
l
save/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBbias_1
j
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2

save/Assign_3Assignbias_1save/RestoreV2_3*
_class
loc:@bias_1*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
t
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*#
valueBBbias_1/RMSProp
j
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
Ђ
save/Assign_4Assignbias_1/RMSPropsave/RestoreV2_4*
_class
loc:@bias_1*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
v
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBbias_1/RMSProp_1
j
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
Є
save/Assign_5Assignbias_1/RMSProp_1save/RestoreV2_5*
_class
loc:@bias_1*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
l
save/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBbias_2
j
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2

save/Assign_6Assignbias_2save/RestoreV2_6*
_class
loc:@bias_2*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
t
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*#
valueBBbias_2/RMSProp
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
Ђ
save/Assign_7Assignbias_2/RMSPropsave/RestoreV2_7*
_class
loc:@bias_2*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
v
save/RestoreV2_8/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBbias_2/RMSProp_1
j
!save/RestoreV2_8/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
_output_shapes
:*
dtypes
2
Є
save/Assign_8Assignbias_2/RMSProp_1save/RestoreV2_8*
_class
loc:@bias_2*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
l
save/RestoreV2_9/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBbias_3
j
!save/RestoreV2_9/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_9	RestoreV2
save/Constsave/RestoreV2_9/tensor_names!save/RestoreV2_9/shape_and_slices*
_output_shapes
:*
dtypes
2

save/Assign_9Assignbias_3save/RestoreV2_9*
_class
loc:@bias_3*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
u
save/RestoreV2_10/tensor_namesConst*
dtype0*
_output_shapes
:*#
valueBBbias_3/RMSProp
k
"save/RestoreV2_10/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_10	RestoreV2
save/Constsave/RestoreV2_10/tensor_names"save/RestoreV2_10/shape_and_slices*
_output_shapes
:*
dtypes
2
Є
save/Assign_10Assignbias_3/RMSPropsave/RestoreV2_10*
_class
loc:@bias_3*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
w
save/RestoreV2_11/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBbias_3/RMSProp_1
k
"save/RestoreV2_11/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_11	RestoreV2
save/Constsave/RestoreV2_11/tensor_names"save/RestoreV2_11/shape_and_slices*
_output_shapes
:*
dtypes
2
І
save/Assign_11Assignbias_3/RMSProp_1save/RestoreV2_11*
_class
loc:@bias_3*
use_locking(*
_output_shapes
:*
T0*
validate_shape(
m
save/RestoreV2_12/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBweight
k
"save/RestoreV2_12/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_12	RestoreV2
save/Constsave/RestoreV2_12/tensor_names"save/RestoreV2_12/shape_and_slices*
_output_shapes
:*
dtypes
2
 
save/Assign_12Assignweightsave/RestoreV2_12*
_class
loc:@weight*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
u
save/RestoreV2_13/tensor_namesConst*
dtype0*
_output_shapes
:*#
valueBBweight/RMSProp
k
"save/RestoreV2_13/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_13	RestoreV2
save/Constsave/RestoreV2_13/tensor_names"save/RestoreV2_13/shape_and_slices*
_output_shapes
:*
dtypes
2
Ј
save/Assign_13Assignweight/RMSPropsave/RestoreV2_13*
_class
loc:@weight*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
w
save/RestoreV2_14/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBweight/RMSProp_1
k
"save/RestoreV2_14/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_14	RestoreV2
save/Constsave/RestoreV2_14/tensor_names"save/RestoreV2_14/shape_and_slices*
_output_shapes
:*
dtypes
2
Њ
save/Assign_14Assignweight/RMSProp_1save/RestoreV2_14*
_class
loc:@weight*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
o
save/RestoreV2_15/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBweight_1
k
"save/RestoreV2_15/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_15	RestoreV2
save/Constsave/RestoreV2_15/tensor_names"save/RestoreV2_15/shape_and_slices*
_output_shapes
:*
dtypes
2
Є
save/Assign_15Assignweight_1save/RestoreV2_15*
_class
loc:@weight_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
w
save/RestoreV2_16/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBweight_1/RMSProp
k
"save/RestoreV2_16/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_16	RestoreV2
save/Constsave/RestoreV2_16/tensor_names"save/RestoreV2_16/shape_and_slices*
_output_shapes
:*
dtypes
2
Ќ
save/Assign_16Assignweight_1/RMSPropsave/RestoreV2_16*
_class
loc:@weight_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
y
save/RestoreV2_17/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBweight_1/RMSProp_1
k
"save/RestoreV2_17/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_17	RestoreV2
save/Constsave/RestoreV2_17/tensor_names"save/RestoreV2_17/shape_and_slices*
_output_shapes
:*
dtypes
2
Ў
save/Assign_17Assignweight_1/RMSProp_1save/RestoreV2_17*
_class
loc:@weight_1*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
o
save/RestoreV2_18/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBweight_2
k
"save/RestoreV2_18/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_18	RestoreV2
save/Constsave/RestoreV2_18/tensor_names"save/RestoreV2_18/shape_and_slices*
_output_shapes
:*
dtypes
2
Є
save/Assign_18Assignweight_2save/RestoreV2_18*
_class
loc:@weight_2*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
w
save/RestoreV2_19/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBweight_2/RMSProp
k
"save/RestoreV2_19/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_19	RestoreV2
save/Constsave/RestoreV2_19/tensor_names"save/RestoreV2_19/shape_and_slices*
_output_shapes
:*
dtypes
2
Ќ
save/Assign_19Assignweight_2/RMSPropsave/RestoreV2_19*
_class
loc:@weight_2*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
y
save/RestoreV2_20/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBweight_2/RMSProp_1
k
"save/RestoreV2_20/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_20	RestoreV2
save/Constsave/RestoreV2_20/tensor_names"save/RestoreV2_20/shape_and_slices*
_output_shapes
:*
dtypes
2
Ў
save/Assign_20Assignweight_2/RMSProp_1save/RestoreV2_20*
_class
loc:@weight_2*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
o
save/RestoreV2_21/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBBweight_3
k
"save/RestoreV2_21/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_21	RestoreV2
save/Constsave/RestoreV2_21/tensor_names"save/RestoreV2_21/shape_and_slices*
_output_shapes
:*
dtypes
2
Є
save/Assign_21Assignweight_3save/RestoreV2_21*
_class
loc:@weight_3*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
w
save/RestoreV2_22/tensor_namesConst*
dtype0*
_output_shapes
:*%
valueBBweight_3/RMSProp
k
"save/RestoreV2_22/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_22	RestoreV2
save/Constsave/RestoreV2_22/tensor_names"save/RestoreV2_22/shape_and_slices*
_output_shapes
:*
dtypes
2
Ќ
save/Assign_22Assignweight_3/RMSPropsave/RestoreV2_22*
_class
loc:@weight_3*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
y
save/RestoreV2_23/tensor_namesConst*
dtype0*
_output_shapes
:*'
valueBBweight_3/RMSProp_1
k
"save/RestoreV2_23/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 

save/RestoreV2_23	RestoreV2
save/Constsave/RestoreV2_23/tensor_names"save/RestoreV2_23/shape_and_slices*
_output_shapes
:*
dtypes
2
Ў
save/Assign_23Assignweight_3/RMSProp_1save/RestoreV2_23*
_class
loc:@weight_3*
use_locking(*
_output_shapes

:*
T0*
validate_shape(
І
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"В
	summariesЄ
Ё
'Encode_Layer_1/weights/summaries/mean:0
+Encode_Layer_1/weights/summaries/stddev_1:0
&Encode_Layer_1/weights/summaries/max:0
&Encode_Layer_1/weights/summaries/min:0
,Encode_Layer_1/weights/summaries/histogram:0
&Encode_Layer_1/biases/summaries/mean:0
*Encode_Layer_1/biases/summaries/stddev_1:0
%Encode_Layer_1/biases/summaries/max:0
%Encode_Layer_1/biases/summaries/min:0
+Encode_Layer_1/biases/summaries/histogram:0
'Encode_Layer_2/weights/summaries/mean:0
+Encode_Layer_2/weights/summaries/stddev_1:0
&Encode_Layer_2/weights/summaries/max:0
&Encode_Layer_2/weights/summaries/min:0
,Encode_Layer_2/weights/summaries/histogram:0
&Encode_Layer_2/biases/summaries/mean:0
*Encode_Layer_2/biases/summaries/stddev_1:0
%Encode_Layer_2/biases/summaries/max:0
%Encode_Layer_2/biases/summaries/min:0
+Encode_Layer_2/biases/summaries/histogram:0
'Decode_Layer_1/weights/summaries/mean:0
+Decode_Layer_1/weights/summaries/stddev_1:0
&Decode_Layer_1/weights/summaries/max:0
&Decode_Layer_1/weights/summaries/min:0
,Decode_Layer_1/weights/summaries/histogram:0
&Decode_Layer_1/biases/summaries/mean:0
*Decode_Layer_1/biases/summaries/stddev_1:0
%Decode_Layer_1/biases/summaries/max:0
%Decode_Layer_1/biases/summaries/min:0
+Decode_Layer_1/biases/summaries/histogram:0
'Decode_Layer_2/weights/summaries/mean:0
+Decode_Layer_2/weights/summaries/stddev_1:0
&Decode_Layer_2/weights/summaries/max:0
&Decode_Layer_2/weights/summaries/min:0
,Decode_Layer_2/weights/summaries/histogram:0
&Decode_Layer_2/biases/summaries/mean:0
*Decode_Layer_2/biases/summaries/stddev_1:0
%Decode_Layer_2/biases/summaries/max:0
%Decode_Layer_2/biases/summaries/min:0
+Decode_Layer_2/biases/summaries/histogram:0
training_accuracy:0"$
legacy_init_op

legacy_init_op" 
train_op

accuracy/RMSProp"Л
	variables­Њ
9
weight:0weight/Assignweight/read:02random_normal:0
A

weight_1:0weight_1/Assignweight_1/read:02random_normal_1:0
A

weight_2:0weight_2/Assignweight_2/read:02random_normal_2:0
A

weight_3:0weight_3/Assignweight_3/read:02random_normal_3:0
5
bias:0bias/Assignbias/read:02random_normal_4:0
;
bias_1:0bias_1/Assignbias_1/read:02random_normal_5:0
;
bias_2:0bias_2/Assignbias_2/read:02random_normal_6:0
;
bias_3:0bias_3/Assignbias_3/read:02random_normal_7:0
c
weight/RMSProp:0weight/RMSProp/Assignweight/RMSProp/read:02!weight/RMSProp/Initializer/ones:0
l
weight/RMSProp_1:0weight/RMSProp_1/Assignweight/RMSProp_1/read:02$weight/RMSProp_1/Initializer/zeros:0
k
weight_1/RMSProp:0weight_1/RMSProp/Assignweight_1/RMSProp/read:02#weight_1/RMSProp/Initializer/ones:0
t
weight_1/RMSProp_1:0weight_1/RMSProp_1/Assignweight_1/RMSProp_1/read:02&weight_1/RMSProp_1/Initializer/zeros:0
k
weight_2/RMSProp:0weight_2/RMSProp/Assignweight_2/RMSProp/read:02#weight_2/RMSProp/Initializer/ones:0
t
weight_2/RMSProp_1:0weight_2/RMSProp_1/Assignweight_2/RMSProp_1/read:02&weight_2/RMSProp_1/Initializer/zeros:0
k
weight_3/RMSProp:0weight_3/RMSProp/Assignweight_3/RMSProp/read:02#weight_3/RMSProp/Initializer/ones:0
t
weight_3/RMSProp_1:0weight_3/RMSProp_1/Assignweight_3/RMSProp_1/read:02&weight_3/RMSProp_1/Initializer/zeros:0
[
bias/RMSProp:0bias/RMSProp/Assignbias/RMSProp/read:02bias/RMSProp/Initializer/ones:0
d
bias/RMSProp_1:0bias/RMSProp_1/Assignbias/RMSProp_1/read:02"bias/RMSProp_1/Initializer/zeros:0
c
bias_1/RMSProp:0bias_1/RMSProp/Assignbias_1/RMSProp/read:02!bias_1/RMSProp/Initializer/ones:0
l
bias_1/RMSProp_1:0bias_1/RMSProp_1/Assignbias_1/RMSProp_1/read:02$bias_1/RMSProp_1/Initializer/zeros:0
c
bias_2/RMSProp:0bias_2/RMSProp/Assignbias_2/RMSProp/read:02!bias_2/RMSProp/Initializer/ones:0
l
bias_2/RMSProp_1:0bias_2/RMSProp_1/Assignbias_2/RMSProp_1/read:02$bias_2/RMSProp_1/Initializer/zeros:0
c
bias_3/RMSProp:0bias_3/RMSProp/Assignbias_3/RMSProp/read:02!bias_3/RMSProp/Initializer/ones:0
l
bias_3/RMSProp_1:0bias_3/RMSProp_1/Assignbias_3/RMSProp_1/read:02$bias_3/RMSProp_1/Initializer/zeros:0"
trainable_variablesѕђ
9
weight:0weight/Assignweight/read:02random_normal:0
A

weight_1:0weight_1/Assignweight_1/read:02random_normal_1:0
A

weight_2:0weight_2/Assignweight_2/read:02random_normal_2:0
A

weight_3:0weight_3/Assignweight_3/read:02random_normal_3:0
5
bias:0bias/Assignbias/read:02random_normal_4:0
;
bias_1:0bias_1/Assignbias_1/read:02random_normal_5:0
;
bias_2:0bias_2/Assignbias_2/read:02random_normal_6:0
;
bias_3:0bias_3/Assignbias_3/read:02random_normal_7:0*
predict_behaviorr
3
input*
Input/Placeholder:0џџџџџџџџџ
output
accuracy/Mean:0 tensorflow/serving/predict