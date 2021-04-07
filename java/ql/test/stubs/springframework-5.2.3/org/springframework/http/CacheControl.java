/*
 * Copyright 2002-2019 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.springframework.http;
import java.time.Duration;
import java.util.concurrent.TimeUnit;

public class CacheControl {
	protected CacheControl() {
 }

	public static CacheControl empty() {
   return null;
 }

	public static CacheControl maxAge(long maxAge, TimeUnit unit) {
   return null;
 }

	public static CacheControl maxAge(Duration maxAge) {
   return null;
 }

	public static CacheControl noCache() {
   return null;
 }

	public static CacheControl noStore() {
   return null;
 }

	public CacheControl mustRevalidate() {
   return null;
 }

	public CacheControl noTransform() {
   return null;
 }

	public CacheControl cachePublic() {
   return null;
 }

	public CacheControl cachePrivate() {
   return null;
 }

	public CacheControl proxyRevalidate() {
   return null;
 }

	public CacheControl sMaxAge(long sMaxAge, TimeUnit unit) {
   return null;
 }

	public CacheControl sMaxAge(Duration sMaxAge) {
   return null;
 }

	public CacheControl staleWhileRevalidate(long staleWhileRevalidate, TimeUnit unit) {
   return null;
 }

	public CacheControl staleWhileRevalidate(Duration staleWhileRevalidate) {
   return null;
 }

	public CacheControl staleIfError(long staleIfError, TimeUnit unit) {
   return null;
 }

	public CacheControl staleIfError(Duration staleIfError) {
   return null;
 }

	public String getHeaderValue() {
   return null;
 }

	@Override
	public String toString() {
   return null;
 }

}
