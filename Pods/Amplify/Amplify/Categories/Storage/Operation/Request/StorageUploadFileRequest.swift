//
// Copyright 2018-2019 Amazon.com,
// Inc. or its affiliates. All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct StorageUploadFileRequest: AmplifyOperationRequest {
    /// The unique identifier for the object in storage
    public let key: String

    /// The file to be uploaded
    public let local: URL

    /// Options to adjust the behavior of this request, including plugin-options
    public let options: Options

    public init(key: String, local: URL, options: Options) {
        self.key = key
        self.local = local
        self.options = options
    }
}

public extension StorageUploadFileRequest {
    /// Options to adjust the behavior of this request, including plugin-options
    struct Options {
        /// Access level of the storage system. Defaults to `public`
        public let accessLevel: StorageAccessLevel

        /// Target user to apply the action on.
        public let targetIdentityId: String?

        /// Metadata for the object to store
        public let metadata: [String: String]?

        /// The standard MIME type describing the format of the object to store
        public let contentType: String?

        /// Extra plugin specific options, only used in special circumstances when the existing options do not provide
        /// a way to utilize the underlying storage system's functionality. See plugin documentation for expected
        /// key/values
        public let pluginOptions: Any?

        public init(accessLevel: StorageAccessLevel = .guest,
                    targetIdentityId: String? = nil,
                    metadata: [String: String]? = nil,
                    contentType: String? = nil,
                    pluginOptions: Any? = nil) {
            self.accessLevel = accessLevel
            self.targetIdentityId = targetIdentityId
            self.metadata = metadata
            self.contentType = contentType
            self.pluginOptions = pluginOptions
        }
    }
}
