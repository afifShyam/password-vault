// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent()';
}


}

/// @nodoc
class $PortfolioEventCopyWith<$Res>  {
$PortfolioEventCopyWith(PortfolioEvent _, $Res Function(PortfolioEvent) __);
}


/// Adds pattern-matching-related methods to [PortfolioEvent].
extension PortfolioEventPatterns on PortfolioEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitPortfolio value)?  init,TResult Function( AttachController value)?  attachController,TResult Function( LoadUrl value)?  loadUrl,TResult Function( Reload value)?  reload,TResult Function( PageStarted value)?  pageStarted,TResult Function( PageFinished value)?  pageFinished,TResult Function( Error value)?  error,TResult Function( Progress value)?  progress,TResult Function( UpdateNavigation value)?  updateNavigation,TResult Function( DetachController value)?  detachController,TResult Function( GoBack value)?  goBack,TResult Function( GoForward value)?  goForward,TResult Function( GoHome value)?  goHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitPortfolio() when init != null:
return init(_that);case AttachController() when attachController != null:
return attachController(_that);case LoadUrl() when loadUrl != null:
return loadUrl(_that);case Reload() when reload != null:
return reload(_that);case PageStarted() when pageStarted != null:
return pageStarted(_that);case PageFinished() when pageFinished != null:
return pageFinished(_that);case Error() when error != null:
return error(_that);case Progress() when progress != null:
return progress(_that);case UpdateNavigation() when updateNavigation != null:
return updateNavigation(_that);case DetachController() when detachController != null:
return detachController(_that);case GoBack() when goBack != null:
return goBack(_that);case GoForward() when goForward != null:
return goForward(_that);case GoHome() when goHome != null:
return goHome(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitPortfolio value)  init,required TResult Function( AttachController value)  attachController,required TResult Function( LoadUrl value)  loadUrl,required TResult Function( Reload value)  reload,required TResult Function( PageStarted value)  pageStarted,required TResult Function( PageFinished value)  pageFinished,required TResult Function( Error value)  error,required TResult Function( Progress value)  progress,required TResult Function( UpdateNavigation value)  updateNavigation,required TResult Function( DetachController value)  detachController,required TResult Function( GoBack value)  goBack,required TResult Function( GoForward value)  goForward,required TResult Function( GoHome value)  goHome,}){
final _that = this;
switch (_that) {
case InitPortfolio():
return init(_that);case AttachController():
return attachController(_that);case LoadUrl():
return loadUrl(_that);case Reload():
return reload(_that);case PageStarted():
return pageStarted(_that);case PageFinished():
return pageFinished(_that);case Error():
return error(_that);case Progress():
return progress(_that);case UpdateNavigation():
return updateNavigation(_that);case DetachController():
return detachController(_that);case GoBack():
return goBack(_that);case GoForward():
return goForward(_that);case GoHome():
return goHome(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitPortfolio value)?  init,TResult? Function( AttachController value)?  attachController,TResult? Function( LoadUrl value)?  loadUrl,TResult? Function( Reload value)?  reload,TResult? Function( PageStarted value)?  pageStarted,TResult? Function( PageFinished value)?  pageFinished,TResult? Function( Error value)?  error,TResult? Function( Progress value)?  progress,TResult? Function( UpdateNavigation value)?  updateNavigation,TResult? Function( DetachController value)?  detachController,TResult? Function( GoBack value)?  goBack,TResult? Function( GoForward value)?  goForward,TResult? Function( GoHome value)?  goHome,}){
final _that = this;
switch (_that) {
case InitPortfolio() when init != null:
return init(_that);case AttachController() when attachController != null:
return attachController(_that);case LoadUrl() when loadUrl != null:
return loadUrl(_that);case Reload() when reload != null:
return reload(_that);case PageStarted() when pageStarted != null:
return pageStarted(_that);case PageFinished() when pageFinished != null:
return pageFinished(_that);case Error() when error != null:
return error(_that);case Progress() when progress != null:
return progress(_that);case UpdateNavigation() when updateNavigation != null:
return updateNavigation(_that);case DetachController() when detachController != null:
return detachController(_that);case GoBack() when goBack != null:
return goBack(_that);case GoForward() when goForward != null:
return goForward(_that);case GoHome() when goHome != null:
return goHome(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( WebViewController controller)?  attachController,TResult Function( String url)?  loadUrl,TResult Function()?  reload,TResult Function()?  pageStarted,TResult Function()?  pageFinished,TResult Function( String message)?  error,TResult Function( double value)?  progress,TResult Function( bool canGoBack,  bool canGoForward)?  updateNavigation,TResult Function()?  detachController,TResult Function()?  goBack,TResult Function()?  goForward,TResult Function()?  goHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitPortfolio() when init != null:
return init();case AttachController() when attachController != null:
return attachController(_that.controller);case LoadUrl() when loadUrl != null:
return loadUrl(_that.url);case Reload() when reload != null:
return reload();case PageStarted() when pageStarted != null:
return pageStarted();case PageFinished() when pageFinished != null:
return pageFinished();case Error() when error != null:
return error(_that.message);case Progress() when progress != null:
return progress(_that.value);case UpdateNavigation() when updateNavigation != null:
return updateNavigation(_that.canGoBack,_that.canGoForward);case DetachController() when detachController != null:
return detachController();case GoBack() when goBack != null:
return goBack();case GoForward() when goForward != null:
return goForward();case GoHome() when goHome != null:
return goHome();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( WebViewController controller)  attachController,required TResult Function( String url)  loadUrl,required TResult Function()  reload,required TResult Function()  pageStarted,required TResult Function()  pageFinished,required TResult Function( String message)  error,required TResult Function( double value)  progress,required TResult Function( bool canGoBack,  bool canGoForward)  updateNavigation,required TResult Function()  detachController,required TResult Function()  goBack,required TResult Function()  goForward,required TResult Function()  goHome,}) {final _that = this;
switch (_that) {
case InitPortfolio():
return init();case AttachController():
return attachController(_that.controller);case LoadUrl():
return loadUrl(_that.url);case Reload():
return reload();case PageStarted():
return pageStarted();case PageFinished():
return pageFinished();case Error():
return error(_that.message);case Progress():
return progress(_that.value);case UpdateNavigation():
return updateNavigation(_that.canGoBack,_that.canGoForward);case DetachController():
return detachController();case GoBack():
return goBack();case GoForward():
return goForward();case GoHome():
return goHome();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( WebViewController controller)?  attachController,TResult? Function( String url)?  loadUrl,TResult? Function()?  reload,TResult? Function()?  pageStarted,TResult? Function()?  pageFinished,TResult? Function( String message)?  error,TResult? Function( double value)?  progress,TResult? Function( bool canGoBack,  bool canGoForward)?  updateNavigation,TResult? Function()?  detachController,TResult? Function()?  goBack,TResult? Function()?  goForward,TResult? Function()?  goHome,}) {final _that = this;
switch (_that) {
case InitPortfolio() when init != null:
return init();case AttachController() when attachController != null:
return attachController(_that.controller);case LoadUrl() when loadUrl != null:
return loadUrl(_that.url);case Reload() when reload != null:
return reload();case PageStarted() when pageStarted != null:
return pageStarted();case PageFinished() when pageFinished != null:
return pageFinished();case Error() when error != null:
return error(_that.message);case Progress() when progress != null:
return progress(_that.value);case UpdateNavigation() when updateNavigation != null:
return updateNavigation(_that.canGoBack,_that.canGoForward);case DetachController() when detachController != null:
return detachController();case GoBack() when goBack != null:
return goBack();case GoForward() when goForward != null:
return goForward();case GoHome() when goHome != null:
return goHome();case _:
  return null;

}
}

}

/// @nodoc


class InitPortfolio implements PortfolioEvent {
  const InitPortfolio();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitPortfolio);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.init()';
}


}




/// @nodoc


class AttachController implements PortfolioEvent {
  const AttachController(this.controller);
  

 final  WebViewController controller;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttachControllerCopyWith<AttachController> get copyWith => _$AttachControllerCopyWithImpl<AttachController>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttachController&&(identical(other.controller, controller) || other.controller == controller));
}


@override
int get hashCode => Object.hash(runtimeType,controller);

@override
String toString() {
  return 'PortfolioEvent.attachController(controller: $controller)';
}


}

/// @nodoc
abstract mixin class $AttachControllerCopyWith<$Res> implements $PortfolioEventCopyWith<$Res> {
  factory $AttachControllerCopyWith(AttachController value, $Res Function(AttachController) _then) = _$AttachControllerCopyWithImpl;
@useResult
$Res call({
 WebViewController controller
});




}
/// @nodoc
class _$AttachControllerCopyWithImpl<$Res>
    implements $AttachControllerCopyWith<$Res> {
  _$AttachControllerCopyWithImpl(this._self, this._then);

  final AttachController _self;
  final $Res Function(AttachController) _then;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? controller = null,}) {
  return _then(AttachController(
null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as WebViewController,
  ));
}


}

/// @nodoc


class LoadUrl implements PortfolioEvent {
  const LoadUrl(this.url);
  

 final  String url;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadUrlCopyWith<LoadUrl> get copyWith => _$LoadUrlCopyWithImpl<LoadUrl>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadUrl&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'PortfolioEvent.loadUrl(url: $url)';
}


}

/// @nodoc
abstract mixin class $LoadUrlCopyWith<$Res> implements $PortfolioEventCopyWith<$Res> {
  factory $LoadUrlCopyWith(LoadUrl value, $Res Function(LoadUrl) _then) = _$LoadUrlCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$LoadUrlCopyWithImpl<$Res>
    implements $LoadUrlCopyWith<$Res> {
  _$LoadUrlCopyWithImpl(this._self, this._then);

  final LoadUrl _self;
  final $Res Function(LoadUrl) _then;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(LoadUrl(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Reload implements PortfolioEvent {
  const Reload();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reload);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.reload()';
}


}




/// @nodoc


class PageStarted implements PortfolioEvent {
  const PageStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.pageStarted()';
}


}




/// @nodoc


class PageFinished implements PortfolioEvent {
  const PageFinished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageFinished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.pageFinished()';
}


}




/// @nodoc


class Error implements PortfolioEvent {
  const Error(this.message);
  

 final  String message;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PortfolioEvent.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $PortfolioEventCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Progress implements PortfolioEvent {
  const Progress(this.value);
  

 final  double value;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressCopyWith<Progress> get copyWith => _$ProgressCopyWithImpl<Progress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Progress&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PortfolioEvent.progress(value: $value)';
}


}

/// @nodoc
abstract mixin class $ProgressCopyWith<$Res> implements $PortfolioEventCopyWith<$Res> {
  factory $ProgressCopyWith(Progress value, $Res Function(Progress) _then) = _$ProgressCopyWithImpl;
@useResult
$Res call({
 double value
});




}
/// @nodoc
class _$ProgressCopyWithImpl<$Res>
    implements $ProgressCopyWith<$Res> {
  _$ProgressCopyWithImpl(this._self, this._then);

  final Progress _self;
  final $Res Function(Progress) _then;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(Progress(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class UpdateNavigation implements PortfolioEvent {
  const UpdateNavigation({required this.canGoBack, required this.canGoForward});
  

 final  bool canGoBack;
 final  bool canGoForward;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateNavigationCopyWith<UpdateNavigation> get copyWith => _$UpdateNavigationCopyWithImpl<UpdateNavigation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateNavigation&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}


@override
int get hashCode => Object.hash(runtimeType,canGoBack,canGoForward);

@override
String toString() {
  return 'PortfolioEvent.updateNavigation(canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class $UpdateNavigationCopyWith<$Res> implements $PortfolioEventCopyWith<$Res> {
  factory $UpdateNavigationCopyWith(UpdateNavigation value, $Res Function(UpdateNavigation) _then) = _$UpdateNavigationCopyWithImpl;
@useResult
$Res call({
 bool canGoBack, bool canGoForward
});




}
/// @nodoc
class _$UpdateNavigationCopyWithImpl<$Res>
    implements $UpdateNavigationCopyWith<$Res> {
  _$UpdateNavigationCopyWithImpl(this._self, this._then);

  final UpdateNavigation _self;
  final $Res Function(UpdateNavigation) _then;

/// Create a copy of PortfolioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(UpdateNavigation(
canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class DetachController implements PortfolioEvent {
  const DetachController();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetachController);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.detachController()';
}


}




/// @nodoc


class GoBack implements PortfolioEvent {
  const GoBack();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoBack);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.goBack()';
}


}




/// @nodoc


class GoForward implements PortfolioEvent {
  const GoForward();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoForward);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.goForward()';
}


}




/// @nodoc


class GoHome implements PortfolioEvent {
  const GoHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.goHome()';
}


}




// dart format on
