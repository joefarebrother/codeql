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
import java.util.Collection;
import java.util.List;
import org.springframework.core.io.Resource;
//import org.springframework.core.io.support.ResourceRegion;
import org.springframework.lang.Nullable;

public abstract class HttpRange {
// 	public ResourceRegion toResourceRegion(Resource resource) {
//    return null;
//  }

	public abstract long getRangeStart(long length);

	public abstract long getRangeEnd(long length);

	public static HttpRange createByteRange(long firstBytePos) {
   return null;
 }

	public static HttpRange createByteRange(long firstBytePos, long lastBytePos) {
   return null;
 }

	public static HttpRange createSuffixRange(long suffixLength) {
   return null;
 }

	public static List<HttpRange> parseRanges(@Nullable String ranges) {
   return null;
 }

// 	public static List<ResourceRegion> toResourceRegions(List<HttpRange> ranges, Resource resource) {
//    return null;
//  }

	public static String toString(Collection<HttpRange> ranges) {
   return null;
 }

}
