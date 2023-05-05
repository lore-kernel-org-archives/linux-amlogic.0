Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C73C77B7D
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 May 2023 06:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnTOrCJJH2NNqWzkQFglmcj4aHOTBVm61qYqHF8U3mQ=; b=r6ylYRMV+v73bKrArL8bsAcjFi
	EjgBp6Xz27+71zh9L50nRazHkEgWBO1KiB5hUN1v7QgqktVt82A9HdM15ebuDsyZYjAZVvnvwT7uQ
	3EH3HJmXKlpvkVJOMeMLsaMYGp52mWxglf4q5PFYYOcJiBPzOXrQGGbnCpH8PHGjYvena8TA1s8T3
	iw+906vBQSi63stVOcPasIpIbStZB/zZhE/qje15wrNIMYNVAWOR8yspA7hMTf+hckP8ze6y6ewa9
	rw6xo5E14Dd7jmlLf8F8ESAL0qyCc48N2UsRtoE2QUXTAB3WwFBkbqnM88goM3EkKuA+0OoqisBvF
	mIcy7LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pupFo-009rXM-1B;
	Fri, 05 May 2023 06:49:20 +0000
Received: from mail-sgaapc01on20718.outbound.protection.outlook.com ([2a01:111:f400:feab::718] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pupFk-009rWd-2r;
	Fri, 05 May 2023 06:49:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQoYJOsEVep9wxYgCnpMCZ6L6788zsRiFr9H90dWOh5RWZSKGhgP3jjgSIDgfjNuBxxpbOOolMBhL18l+SOpNDNVd0/eqZZ6LgoPbFeGVd22UAa1b6CkCldtb5q8kMEUnkPuKchVm4vCaODbLmRHFcrlJSPbYbaBQUjloFhyU8EcYFpQXjEcVauXADUi34/A8oIayvnOXT8pWBAjLRJHQkfOefGgPTcUqvvBwRzg2tL6RGsWga4T7RTXzeN0fv+MDV4ryud5OoesIhp3W4rLpQOi4JCaiSg2QS+67ZP6wCdekJCgdVPU+N9FJuJtvgz0rKtNagWoeTKlbr7ovrNFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks2tbyO+YXbTuOE1ap44A0YRxnKawwtL+p6iayopjHM=;
 b=dK4OQrXsgAQgkvhV37lGRSDvDGHGa+4DF5Y6tHvx7lCpko4/knJ6JKyrOtWjeOZ4Qtzd7jnVTpnPer0Nd5xhmCTenOsKRp86EGSnGr6jHguyTrRDFJaXuYGWOdw5MW2U1bNTsHVkJLIfClJuz2LaQt02mOpH+cY8N/iluafmxDF+wKfMHOpFIjhqUdyAo7u9cwQ+/H5Ji/CNuB+IiTwoLLhEUowiVjHI52BZCJv3BBem9PFG+lLDIwvIvSr7YRIJzuNA4w2nDQH4CTFET4SZBa/pecNk+sgcan9JDibCYdPisWW0gEk8WI19gtAKmaNiqAoMCGNidvQlMLhZEbz4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks2tbyO+YXbTuOE1ap44A0YRxnKawwtL+p6iayopjHM=;
 b=JyxqzMYL/AnuLKlWIfwn3HXkRFDspVkb9FmrFnTuGcfdq2Cj/HDkQBosgNGw2EzTdPcJFQMF9HAEef39gzf1YRSeE244fLkkTHxUlN/FvSyN1dCy+4bB4uPq7RC0sd9lMNqzLNJebna38xdZ/NH0ndlQzWVwerAa/Zd94Fegddzh2vjb3iZ18DqNixgw3sSqrXrZOWkWsgbWLeouXMf6py1EBWGpwkd0N1xmiZ4GuQmHHYJypvbNop9A8tQmRh6KiMbI3EC8++Dwkzn+ZYLaeHdXPqO5h9XSnURT0VH1snm1AMfBsO73/qgITw6zBPIO01Y3aP8kAAEEt9IjhiHidQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB2734.apcprd03.prod.outlook.com (2603:1096:3:21::22) by
 SEYPR03MB7250.apcprd03.prod.outlook.com (2603:1096:101:bf::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.25; Fri, 5 May 2023 06:49:04 +0000
Received: from SG2PR03MB2734.apcprd03.prod.outlook.com
 ([fe80::9c6d:3128:b370:5fb4]) by SG2PR03MB2734.apcprd03.prod.outlook.com
 ([fe80::9c6d:3128:b370:5fb4%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 06:49:04 +0000
Message-ID: <04b2a566-ed83-1e47-1571-e3d5ae4d3323@amlogic.com>
Date: Fri, 5 May 2023 14:43:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2] arm64: dts: add support for C3 based Amlogic AW409
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230427085859.793802-1-xianwei.zhao@amlogic.com>
 <36e7a445-7d19-911a-1a94-ffc30172e1a3@linaro.org>
 <e3083eab-ba85-3e9b-b3f2-f50816163f9f@amlogic.com>
 <d2ca44b1-71ab-093f-0dee-fa66e4aa378a@linaro.org>
From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
In-Reply-To: <d2ca44b1-71ab-093f-0dee-fa66e4aa378a@linaro.org>
X-ClientProxiedBy: SG2PR06CA0219.apcprd06.prod.outlook.com
 (2603:1096:4:68::27) To SG2PR03MB2734.apcprd03.prod.outlook.com
 (2603:1096:3:21::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB2734:EE_|SEYPR03MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b725ff9-9552-414a-91a3-08db4d34cff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9lMWi0aASB0Vvx2lbRTNHL3bjRaxPJug0SJAQMYCqg3/qKzr5bcCL+YwBN+ASaNMIYy8pA6Vjzu1T+MWUeDXE4jibCu5mLActGmv0mkdmqMoRVcLve7ijGK2/v8mZ+8fUAwcUc7wxtKF4rteGTgGDn3ZNepwvJY+TTXkKizXnZ4k31fF6Ljp2TCr7q/nQpKratmnT4WTM53jIfbZB8qspU+Ry1B9CA5aIgE1C1JpdywOYcpJjzOF8sDUbeXnlgk+vsodeDcP4yJm/Pi+3OKS7BK+9lYFtP0cRDBXQNxYUoBNqt9mYDQvpaW3Ixj7PTzOiV5cLGyTrdpJu6EXzZHmuW1v46GI1GxFZpbu2gCn65bhGUCZgj9UZF/+okXNfGqGFS9AEChq/pM1jNrd3dn5wG2bWHro0pQtsTZbLBDe1xb7prQUkayL3TpKEn7BNBi51x3JjDAgY8CU1TftIMQSoqqei3nYM7nWTig//6013RJpLfJ91410u/0MTSYlf0OHU5Zvjhcqs+qg/fMj/4NQ1ezsbgCIUDb3OR1Z6CXUbK+DaGpFYFR1DTORAzuASVbRzBwbldVSkKebjRflbuWw/Ou24hhJrkidzTIphxPMWuLr7hgBT77n7FQjeRHRxRsLfZVAohbiuZMQb/X4C2DSAg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB2734.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199021)(7416002)(478600001)(966005)(38100700002)(8936002)(8676002)(5660300002)(2616005)(86362001)(6666004)(31696002)(66946007)(66476007)(36756003)(66556008)(4326008)(6486002)(83380400001)(6506007)(26005)(53546011)(186003)(316002)(2906002)(41300700001)(6512007)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Y1IzU1QrSm9Ta2N0QkJiMWVBMlJKVEN5WnIvRmJXc3BjblgwNDk2cmlEN1Ba?=
 =?utf-8?B?UDMwMm1JQWRJT0RKZ1A1Y0p6UVAxWVd4VDRPcWJsMGJBQ1Brc2V2aHQ1QzVl?=
 =?utf-8?B?TnlTV25yTUV3anBBRHhxMk9iRm43Zk9MdXBWd2dmSFZJMVJWVklWU1RoVTBF?=
 =?utf-8?B?bXNmMEFLZDBFcEFuM29acVVBdUZtQlJhMlN2NlFvNVFSOC9qbVhpNGNlYW9R?=
 =?utf-8?B?dmZxejlzU2pNUW95TjZ5SERNZEFEaDFpa1ovbjZGc1B1VForU0R1bFFaN05j?=
 =?utf-8?B?WXRxZDEyNzFzRWtTRTFjYWZnanZKeGZVdm9xL2x5SktWaE1EV1N3RXVwTWdv?=
 =?utf-8?B?NmtiU21QSkc0YytJeU5QVmRjOE1lU1FoYkdxL1ZKYTFTd0pQSmFEZ3dsTDVB?=
 =?utf-8?B?ajB4ZmZhU0I4cmFDMmZOVXpzang3MXNTdkljRERpNTkxcVpxbmpQQUMvU0R6?=
 =?utf-8?B?VUNqR3hZS1FMUm96Q3JBRmgzbktFNVJ3VzB4dnJMMGtheDBKK0lLdWlRR09a?=
 =?utf-8?B?VUNtNm1XOXhoT1hnMSt3MGlTOUFXTlFPbmdHWkZDQ2hSQ0RoNEYwMUFZVXN0?=
 =?utf-8?B?eUE4amZBd1NvaXRGcXlvSzY5WEhHK3FiT0NqMnpPbTdrYTZhOXBaaWJWMFlH?=
 =?utf-8?B?QmFSUFM0L21CM0VSNVBJWlE0Q2tncFg4RXFLOG15UXpWeHFET3JhRTBBaVgz?=
 =?utf-8?B?aW5GdXRHWUdDQkl2Wm9OenlBcDZHbEgxNzBQZlgvUGpXSUYrdmtmenByS1p4?=
 =?utf-8?B?OU0rQ1BkMFVML1R0cklQempYU1RqZXdWeVZ3ZUZEc0dybUROUWRqTEUrWXpo?=
 =?utf-8?B?MWM4c3NsczA5NHhBRVpQcjdkam1sbFRNaFBZSmNUZFVmcmZwa3FMY2FhODNm?=
 =?utf-8?B?OFZFN1U4a1BIK01wL1dWc1FzM2w1ZGt0ZEhNUWw0NFRDTVBGSDNnTjBlNTFG?=
 =?utf-8?B?Njh2bFRybE5tL29KS1VUVzNiTXFwSFpUSXZCSUk0QXBCTTZCaWRJaGJYaEYy?=
 =?utf-8?B?T2MyZXpLeDlvUzVPaWtMOW9wTDJibStsc2lJQ25abjhxQ2VHZEpJYTlXcWww?=
 =?utf-8?B?QW16bE5Cd2s2Nm4yaUdBWG9BenFPZ2hydW5xcnJZeWFObzRHWEhvSkRVUXAx?=
 =?utf-8?B?eUduQS93eStJSitLcE01eS9oTDhiTittb3p6K3ZQQVFjVXFMOExjZVk0ditO?=
 =?utf-8?B?enJWSHJzeHI3U2crb1UzbzBSVUkrcjFBQ2RabGNHVjV5ZmR3NENjblJaTlNG?=
 =?utf-8?B?NUVuL0UyQ0ZTOERZZkhjSWd5N2QxQm53V2hUQnVMK1J1Z29WaFRFSVphekw5?=
 =?utf-8?B?S0dJYmZvSlJIaHp4RmFkUldIb1VZT1ZlN2pabXE1ZVVaOXlwaXFmSzJaaVdq?=
 =?utf-8?B?NXI1SFhNQjNOY1ZEc3ZNMnNFYlhzSUMxQlptb0I0cFF3OHVsWVZ3WmZGaExT?=
 =?utf-8?B?S2ZoaExYVVFjQmZYTnpXTUFxSHF5RHdERlJNRFVrd0dtb3V4RlVIRkc3Qmpr?=
 =?utf-8?B?WWcrSkxCL0xOWHhWNFcrYXczYUxGTXlTUnEySzg5MVdGL2NXcldQbngvY0pt?=
 =?utf-8?B?cHNYWjduSFlJbG1xM01aOUV5bUJCTnkyck9Cb1pzbzNzYVJHUW1kMC9Kb1Bi?=
 =?utf-8?B?NGgyNFhUSlhCU2tNTlpQMlZkVE04YlA4eHlnRXcwQ2NCVkJUcnY1RkY3QWlO?=
 =?utf-8?B?Q21hZFFtaHFKNDhGeWpMMHlIeTc1Q09nRWR2ZWdlQk9iaVhUZXNXOHJSOFlz?=
 =?utf-8?B?Ui9XRkhVWWdpVkNYcTZwWktybW1xcGVoSTNwRGhvQXFZWDRwOGEvMERpNm9a?=
 =?utf-8?B?YmNHOWdBbzJQTkFUeFFwY0VHZzNwSktCUUc1NFJCK0pBWGxRNWMvOUVhNk5R?=
 =?utf-8?B?aWc2V0d1UnF5ZkR1YVU3azlEeVcvWVgxbngwaG9UYS9mQk5aRXhld2xBOHpF?=
 =?utf-8?B?THJGdTI5L2RmS2drdWZnMzg2VnhKcDJGb2Zlb3FwSFdwLzRTU1hQeEhGNGdU?=
 =?utf-8?B?WlhCZEdhd1k0WGp0R1FTeTk0b3NuVUpQalJJeVhvdnQyc215SG40WWpMRnRN?=
 =?utf-8?B?YVRucVhJaEp5RUwyL1F3RnRtQzZKSERpZE1GWU5mOUNEaHIvZllhems5Mms0?=
 =?utf-8?B?d1JTNHN2eW43Wm85RzMzTHdNSVpLZVNGMTlwL2ZjTFBQd1NhRUhWV1FnUWR5?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b725ff9-9552-414a-91a3-08db4d34cff6
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB2734.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 06:49:03.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoB1wNEGGVWom+X08Aq2uKEOELGAC4ISsUsLfKsrLqiiZWQC+uEC0QIgc1te1tV43lF/Ewe/bZWKDCrolMCDNvGC2PzwQQE2du/56Cn7kEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7250
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_234917_116925_4C357011 
X-CRM114-Status: GOOD (  18.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzUvNSAxNDozNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBbIEVYVEVS
TkFMIEVNQUlMIF0KPiAKPiBPbiAwNS8wNS8yMDIzIDA0OjM3LCB4aWFud2VpLnpoYW8gd3JvdGU6
Cj4+IEhpIEtyenlzenRvZiwKPj4gICAgICAgIFRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4KPj4K
Pj4gT24gMjAyMy81LzEgMTc6NTgsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBb5L2g
6YCa5bi45LiN5Lya5pS25Yiw5p2l6IeqIGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZyDn
moTnlLXlrZDpgq7ku7bjgILor7forr/pl64gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRl
cklkZW50aWZpY2F0aW9u77yM5Lul5LqG6Kej6L+Z5LiA54K55Li65LuA5LmI5b6I6YeN6KaBXQo+
Pj4KPj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IE9uIDI3LzA0LzIwMjMgMTA6NTgsIFhp
YW53ZWkgWmhhbyB3cm90ZToKPj4+PiBBbWxvZ2ljIEMzIGlzIGFuIGFkdmFuY2VkIGVkZ2UgQUkg
cHJvY2Vzc29yIGRlc2lnbmVkIGZvciBzbWFydCBJUCBjYW1lcmEKPj4+PiBhcHBsaWNhdGlvbnMu
Cj4+Pj4KPj4+PiBBZGQgYmFzaWMgc3VwcG9ydCBmb3IgdGhlIEMzIGJhc2VkIEFtbG9naWMgQVc0
MDkgYm9hcmQsIHdoaWNoIGRlc2NyaWJlcwo+Pj4+IHRoZSBmb2xsb3dpbmcgY29tcG9uZW50czog
Q1BVLCBHSUMsIElSUSwgVGltZXIsIFVBUlQuIEl0J3MgY2FwYWJsZSBvZgo+Pj4+IGJvb3Rpbmcg
dXAgaW50byB0aGUgc2VyaWFsIGNvbnNvbGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFu
d2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Pgo+Pj4+IC0tLQo+Pj4+IFYx
IC0+IFYyOiBSZW1vdmUgbmV3IGFyY2gsIGFuZCB1c2UgQVJDSF9NRVNPTjsKPj4+PiAgICAgICAg
ICAgICBNb2RpZnkgbm9kZSBuYW1lLCBhbmQgZGVsZXRlIHN1cGVyZmx1b3VzIGJsYW5rIGxpbmVz
Lgo+Pj4+IC0tLQo+Pj4+ICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAg
ICAgICAgICB8ICAxICsKPj4+PiAgICAuLi4vYW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3NDA5
LTI1Nm0uZHRzICAgfCAyOSArKysrKysrCj4+Pj4gICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtYzMuZHRzaSAgIHwgODYgKysrKysrKysrKysrKysrKysrKwo+Pj4+ICAgIDMg
ZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKykKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2
bS5kdHMKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtYzMuZHRzaQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9NYWtlZmlsZSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtl
ZmlsZQo+Pj4+IGluZGV4IGNkMWM1YjA0ODkwYS4uYmNlYzg3MmMyNDQ0IDEwMDY0NAo+Pj4+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+Pj4+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZQo+Pj4+IEBAIC03NCwzICs3NCw0IEBAIGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEtb2Ryb2lkLWhjNC5kdGIKPj4+PiAg
ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXNlaTYxMC5kdGIKPj4+PiAg
ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXg5Ni1haXItZ2JpdC5kdGIK
Pj4+PiAgICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLXg5Ni1haXIuZHRi
Cj4+Pj4gK2R0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBhbWxvZ2ljLWMzLWMzMDJ4LWF3NDA5
LTI1Nm0uZHRiCj4+Pgo+Pj4gTG9va3Mgd3JvbmdseSBvcmRlcmVkLiAnYScgaXMgYmVmb3JlICdt
Jy4KPj4gV2lsbCBkby4KPj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9hbWxvZ2ljLWMzLWMzMDJ4LWF3NDA5LTI1Nm0uZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtYzMtYzMwMngtYXc0MDktMjU2bS5kdHMKPj4+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWRjZTg4NTBiMzM4Cj4+Pj4g
LS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLWMzLWMzMDJ4LWF3NDA5LTI1Nm0uZHRzCj4+Pj4gQEAgLTAsMCArMSwyOSBAQAo+Pj4+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkKPj4+PiArLyoKPj4+
PiArICogQ29weXJpZ2h0IChjKSAyMDIxIEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZl
ZC4KPj4+PiArICovCj4+Pj4gKwo+Pj4+ICsvZHRzLXYxLzsKPj4+PiArCj4+Pj4gKyNpbmNsdWRl
ICJhbWxvZ2ljLWMzLmR0c2kiCj4+Pj4gKwo+Pj4+ICsvIHsKPj4+PiArICAgICBtb2RlbCA9ICJB
bWxvZ2ljIEMzMDIgYXc0MDkgRGV2ZWxvcG1lbnQgQm9hcmQiOwo+Pj4+ICsgICAgIGNvbXBhdGli
bGUgPSAiYW1sb2dpYyxhdzQwOSIsICJhbWxvZ2ljLGMzIjsKPj4+Cj4+PiBNaXNzaW5nIGJpbmRp
bmdzLgo+Pj4KPj4+IFBsZWFzZSBydW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBmaXggcmVw
b3J0ZWQgd2FybmluZ3MuCj4+Pgo+PiBUaGUgYmluZGluZ3MgY29tbWl0dGVkIGJ5IE5laWwsIGl0
IGlzIGFwcGxpZWQgdG8KPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvYW1sb2dpYy9saW51eC5naXQKPj4gKHY2LjUvYXJtNjQtZHQpLAo+PiBiaW5kaW5n
czoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNDA3MTAyNzA0LjEwNTUxNTIt
MS1rZWx2aW4uemhhbmdAYW1sb2dpYy5jb20vCj4gCj4gSXQncyBub3QgaW4gdGhlIG5leHQsIHNv
IHBsZWFzZSBhbHdheXMgbGluayB0aGVtLiBXZSBleHBlY3QgdGhlbSBhbHdheXMKPiB0b2dldGhl
ciwgc28gaWYgeW91IGRlY2lkZSB0byBkbyBvdGhlcndpc2UsIGl0J3MgeW91ciBqb2Igbm93IHRv
IGtlZXAgdXMKPiBpbmZvcm1lZC4gT3RoZXJ3aXNlIGhvdyBjYW4gd2Uga25vdyB0aGF0IHlvdSBz
ZW50IGJpbmRpbmdzIG9yIHlvdSBkaWRuJ3Q/Cj4gCldpbGwgYWRkIGxpbmsgaW4gVjMsdGhhbmtz
Lgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
