public struct KobaConfig {
    public var cacheControl: CacheControl?
    public var csp: CSP?
    public var featurePolicy: FeaturePolicy?
    public var hsts: HSTS?
    public var referrerPolicy: ReferrerPolicy?
    public var xcto: XCTO?
    public var xfo: XFO?
    public var xxp: XXP?

    public init(
        cacheControl: CacheControl? = CacheControl().default(),
        csp: CSP? = nil,
        featurePolicy: FeaturePolicy? = nil,
        hsts: HSTS? = HSTS().default(),
        referrerPolicy: ReferrerPolicy? = ReferrerPolicy().default(),
        xcto: XCTO? = XCTO().default(),
        xfo: XFO? = XFO().default(),
        xxp: XXP? = XXP().default()
    ) {
        self.cacheControl = cacheControl
        self.csp = csp
        self.featurePolicy = featurePolicy
        self.hsts = hsts
        self.referrerPolicy = referrerPolicy
        self.xcto = xcto
        self.xfo = xfo
        self.xxp = xxp
    }
}

public struct Sources {
    public static let data = "data:"
    public static let none = "'none'"
    public static let sameOrigin = "'self'"
    public static let src = "'src'"
    public static let strictDynamic = "'strict-dynamic'"
    public static let unsafeEval = "'unsafe-eval'"
    public static let unsafeInline = "'unsafe-inline'"
    public static let wildcard = "*"
}

public struct Seconds {
    public static let fiveMinutes = "300"
    public static let oneWeek = "2592000"
    public static let oneYear = "31536000"
    public static let twoYears = "63072000"
}

public struct ReportTo: Codable {
    private let group: String?
    private let maxAge: Int
    private let endpoints: [ReportToEndpoint]
    private let includeSubdomains: Bool?

    public init(group: String? = nil, maxAge: Int,
                endpoints: [ReportToEndpoint], includeSubdomains: Bool? = nil) {
        self.group = group
        self.maxAge = maxAge
        self.endpoints = endpoints
        self.includeSubdomains = includeSubdomains
    }
}

public struct ReportToEndpoint: Codable {
    private let url: String

    public init(url: String) {
        self.url = url
    }
}

extension ReportToEndpoint: Equatable {
    public static func == (lhs: ReportToEndpoint, rhs: ReportToEndpoint) -> Bool {
        return lhs.url == rhs.url
    }
}

extension ReportTo: Equatable {
    public static func == (lhs: ReportTo, rhs: ReportTo) -> Bool {
        return lhs.group == rhs.group &&
            lhs.maxAge == rhs.maxAge &&
            lhs.endpoints == rhs.endpoints &&
            lhs.includeSubdomains == rhs.includeSubdomains
    }
}