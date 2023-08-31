Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01459C83F12
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Aug 2023 12:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLUrU3WXrS7VqqnHH3lvezuXXV+o1/Anlj6t2XLLV/k=; b=imdZuQuLLN7K9kp3zhH9LvbRzG
	5ZrOeV0cgI/ezWZnmbt4h4JPnemUgo7ksedm0odqXHe/+qPCAyCn9I0byTc0DLOlqglKUTv2oYatb
	O3d3l+WgtSE8GNfFGou8MP+FfPlAFfHgTa8Tzz0Y+Ij5e1oTLAwRk8AKHK6KqUUUUzNYPbG2X/p43
	UXREOPThedCyhRZdsLcYpxRiZALQa2qf5k8Nn44a8HhSQNixQlIdM8G2SvLVGVrEhVnXgDv0U2Vzl
	fd0p6JuCFsm6BUC3rC5hoPsltPjW7a4z/DG+9SPhbycTsTWnps2eaH5Ov+IYsqa7SrvAy8yrPXeWM
	EX4yp6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbgYP-00FGCE-05;
	Thu, 31 Aug 2023 12:13:41 +0000
Received: from mail-sgaapc01on2070d.outbound.protection.outlook.com ([2a01:111:f400:feab::70d] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbgYM-00FGBP-2Q;
	Thu, 31 Aug 2023 12:13:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcOb3RpeX6ARNaKogUlBkJdOF1gti5C7ueomNrXBU3aWimJj3TcY2TCigKrFW6oxg3A7xVhLxbc2Z4elgNtd8aKliyiADEpLaegmMRlaa0kmsMqvW52QJRqmtR+jFe/vz7p05iKTQOzLofxmS2lbZyCYNAZ2CQQsnMrgAiMLfe9+lXLforYqVHK1afWYlOjmjTutCNzOIOVjzArSNOLixpw1Jbzz8WL87LCscae5RrySI8erQoG4Nw9KOOALfWCp+Nw5EnSlWgYosj7J7dNP9Wgvh0WQwee9vsy2cqLinDGxtEpldcoHwHg4NYHJF6PBw7oaXlj4vPg0IuCcbFlzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dznaFVogfRqivBp9395Rm3mvT7q6Vw6N2TXPEatct8M=;
 b=WBq0psyWMMqgQpAOVM6EBpQDLy0oreyQgDpyE/0IZtIapLpIfoIirEjGkiTaQQtu/Oh3kT3NCl1H+rWuoX/MP9RdBbhLi9NfMD2AGfy9IYwZvKjMh1/uNFfFnSZcl4yn6sYcuqwnuWTMMOVHCUU5M3wYFSbutPp0QAIvS7u5SWUJvpA5jzOKq/R9A8qdB4Bqv8cqd+awy9KFw4nijqs3qBsWUvCSwpMWX00Rg6viMP7Td7Q7twtxC0Y4wr3WtClo6ltFlve00OBxbr8uqTSTvGts0skzGxlxPv8+zpxW9MUOQ4dwn9ULvNcMrhswL3CC9UmAzT9cEL1+beb2Ohhm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dznaFVogfRqivBp9395Rm3mvT7q6Vw6N2TXPEatct8M=;
 b=bAr7kqPYQUJ8BpKz2G1t8ZN29Yg4hjjisjU60EjFmo+1F9ttUcfHeSriTfSLxSk+owH56O+sN7G6+ss4igVOr5Mm5ukFArFaCVZnkWdBHAU/37MBlta/Yq1cJ9eGL3ERs1dmbwQPwTrZf1fFMuWch6qSMnYW0+Q7IG32eWB2vRphazQ697rqmGWIsngPwVIQGVjlwKBvNu7+WXjMDXqRZjNNmLiv07KHgugzbZQAWiIlYlJDpOSx/7bEPc0vxqDN0y7Soyy4UvBL1qc7KRFa2Gbow6dC4Kc3wMr7eFLtJSyvzcOLjW+Vilra+qSFKXTze6TWottr64gX1bgS7ImxHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by TYSPR03MB7521.apcprd03.prod.outlook.com (2603:1096:400:411::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 12:13:28 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 12:13:27 +0000
Message-ID: <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
Date: Thu, 31 Aug 2023 20:13:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
To: Sean Young <sean@mess.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
From: Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <ZO2gvMl2IS70ve3T@gofer.mess.org>
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To TY0PR03MB7240.apcprd03.prod.outlook.com
 (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|TYSPR03MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ffd36f-71ff-47da-017a-08dbaa1bae0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G73KZRe0cxxJ3xHRV2oTW4nHUAkT8LZbX6YdHFlMU0aFqnlktIdNGbGeOhL3uymSbsucanCdrhHgSS/6i5xTbeQ5No9OMB3uZ00LjzoianyOXBqJ2g7vzBoY/tdtdUZMg4xCKN/sxmLT62SPtdAFrSNXWvfKUniWFDa0pI75APf9M0tMlC5rAro23f9L17j3FmC8/V9AQr2DkrpYlR8Ir/1IS4EgnBvgFWc9QvTIR87fhDohqdZ4k4x8QVtRVYQ7qz8laPZh6IQgBo06V3MyAwtAz9It3cNyCcWlOkiD00VgweGyA/H5XszGxpBnVTEMUD+RkF5VnCuWDaf7j5nFqgwiTHsbPfOxmfCoeoCKpgn9Z7w6EB0CxcCRye4/TjKCkdpa3OCdAKiC5IsK7Uut/duUZDApqxIFGfraMwD9rknKrM+UiVa2S81R1nMnyqDGCbj82YSrav/DFQBJiS2RjNfCyUmbmW9MdPawwK4m6KOqJBSVmMbIQRl6UPMF8ihTif4jDvNaR/viAV08FCn36LGKIcxuiu2yYArfEKkEKDBSGB35WxeRBy9LW2fAuMZ/oxeB+7IpD8cnS1nsXoANzK8qGqN92jyS+u17G7j1zMQ8HoFiR1OKrap2evb0ihb4+w7og7eBI17fZgxE53MMxc7Ha4fUddE7LzGcD8aSsWhKWbpbDRX/GjDUHwFrAPh/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39850400004)(451199024)(1800799009)(186009)(6666004)(6486002)(6506007)(6512007)(478600001)(2616005)(107886003)(2906002)(26005)(7416002)(316002)(66556008)(6916009)(66476007)(54906003)(41300700001)(5660300002)(4326008)(8676002)(8936002)(36756003)(86362001)(38100700002)(31696002)(31686004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YktPOWd3TDZrT01ZV0IyVEZUckNVS25zT2Y4YXNzUXlHRWNPV2VBWnluTVEz?=
 =?utf-8?B?VURscTNVaGRWQVBpNVhPZmlkVkRQMkxLNDlSYW1SQkpTT3REUis2T3pMcGN3?=
 =?utf-8?B?NFVEcjI1ZENPaWg1c2ZhOG41cXBEZ1pHK1lXR21ObFQra3lzMTdzVXNIWDBi?=
 =?utf-8?B?ay9uWnRSU0xieTdqdkJJMS9qWXAwY1NEbDFQTWg2TTFYaFhEOWxHRzJRS3Vz?=
 =?utf-8?B?UHQ0RHJwdXdRTFBScWlyd3E2U1A4SXNBQXJpVGpWaTljL1J6cEVsMk9iVCtU?=
 =?utf-8?B?TGZQYU10M25pV2trRFJlaUlSREZjK3kxVGp6dXFHR0YwajdLd251ZDc5R3dh?=
 =?utf-8?B?Z005SFJRekg5YXdTMngvZXFBK1RVZ2lHeTZJUUdlY1VQZUhwdGpIclcwTk1t?=
 =?utf-8?B?U21SUVJrVjdUeVUrY1luTitxTHpUamhTTmhYMUhlUUIvdHMwcm8vd3l3TDNF?=
 =?utf-8?B?ZCtjdnhpZVpQalBxV0ZYY1pPQVJDMWpESHVHQTdJeUNkZUg2V1duSmNhN0ZN?=
 =?utf-8?B?TnpZNFZyLzNTaFk1N0pZZTA1QVlMd3hZZU14d3IrT2JNZmc0OTlWNlJETzNt?=
 =?utf-8?B?M0tLdFY2L1RkaEpDcXF6bDBmbUNQdjZBME5vUXdKMi9VRXRHd2NmeUQyVUtx?=
 =?utf-8?B?U05tUk9jTGJqcS9jZC9zanJGTVZlNUszdnhEQ1pxK0xOWG5kYk5EM2s2VnNE?=
 =?utf-8?B?bk9oOTI4NE5jRmVjekkxd2h6U3VXa3RPK1FXMUtIbDNOUVVZNmVpL1pvYWtN?=
 =?utf-8?B?QkdCcHpRWm8zOFBuTlBFdGxNVHA2STRHLzFBRDZDaDdQSno4RnpNSmNzZ0Er?=
 =?utf-8?B?OVZlTzFCREhvODRZRGlGSU9Dc2JkQXRUOU9tVUprUkdFMnJSOGxzSjUyVlBT?=
 =?utf-8?B?WXpaMTlEWGRLb3FhazFtZGYzdWlDdFpsK2dSZjdPMTdZM2llYWhEYlVtUmhM?=
 =?utf-8?B?ZkN4NnJzRmovOEE3d01iRDl5UlBYSnBoSFNsdjBnNzVjZVR1V3BIOXRVMDNk?=
 =?utf-8?B?d0owaTBmMWkzMG5FWnFWUHA5a29qZ2hCVHJsRElkWDFWQ0xXZ0QwemU2NTd4?=
 =?utf-8?B?TDM2V0crUy9pWWpud1oxck94Y21KRThSVUswSjIrajFMNjFWcXJWdlM5cHc3?=
 =?utf-8?B?L1hvcTFSYVdtRldRaUJOdjI1YjBjNUtISDRMb2lheGlYWWNGRVFkSElsaXF5?=
 =?utf-8?B?OGZoZ29kZmRHY1M4Zk5KYzQwbVcvb1FEbWIrVVJVT1YrYjkvYkpkdmhta25U?=
 =?utf-8?B?N1ZybENMZytucDhzMDZ0dnZBN1RGdGZLdlY0TU9hby80SXh1K1JyeTk0TFBp?=
 =?utf-8?B?THpnT0VQc3JjMUhQK3ZGMFFZYVBQQitnT2JhVERjZkREdVMxU3ZvbE1vSGtC?=
 =?utf-8?B?RS80RkRwSDVRYWxqOThna2JXZ29DRWkwMklkMG5rWG54S0R6M0g0eER5ZG9h?=
 =?utf-8?B?UW9vTzBEVjBUbkV0Nk14MmhwdE1kYUlKNWhwTjVmeDZvakRFM0lBcExUc1RJ?=
 =?utf-8?B?UkhsTUk4SWluRUp6K2tnM3FNR0xzTEJQb0RnYVdOMk91eWhpeU44QXcwS2R1?=
 =?utf-8?B?b05RcW9rZUt4alVRZnZXOGYrN1N6MURaY3VaQ3RIU1IvN2JHNWw2OW5FT3Yy?=
 =?utf-8?B?K3JSWHRPcmxrVU1ybk41dEdxZnlCR2JYWUpaQS9ZTDFaMDBCbXZsL2lHN0Fx?=
 =?utf-8?B?azREazdGWWRRdkhBNEZRVFQ5WkZBelU4aHhQSmg1eWhkcEY4NkMzM25leGF3?=
 =?utf-8?B?cS9jVStwVzhLejdhNHdPTGR4VVJMcy9ScW9LeTYvQnF2eFYwSjUwUEFqNXZo?=
 =?utf-8?B?YkhrYUo1OEdIdkgxUGxYalVNOUpwN1ZuRlMzQWZ2MDNRSC9rRzdwdFRVQkd5?=
 =?utf-8?B?NnhLUVMvemcyNzRZdzh6TzFFQ1ppSHNUeGFOMWlLcG9INTJpTGx1c1lUejZl?=
 =?utf-8?B?Y09VUkI5ZVBDV3lIVHlPbHIyZGJVRTNHMFVHbFZ2UktWczNGUWZoZ01ZS3ps?=
 =?utf-8?B?Z3FxMlRYNmJacUtEYXZwM3A2bTF6a2ZERTVqQkRHcDI3RWdqWUovNUtXMG5o?=
 =?utf-8?B?cUo0RXNDWE95d1hZdDV3a21rcVZwTGNmNGtzTWxzWVBvN1lRR050YmZqZFo1?=
 =?utf-8?B?TFVUTENOVU5HeTFUcSs0aTJSNS9Oa0lGTysweS8ySGZFK0dTRVJwOXVSSDBu?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ffd36f-71ff-47da-017a-08dbaa1bae0c
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 12:13:27.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VBwvQb1kG8T89dAPiYZqwGZKQg7muVAlFstfU4AQXmhJa769TedtjAFH8KGZvF4PwJY4IrQIsbXDVnEb7safg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_051338_810794_7B3A7EA5 
X-CRM114-Status: GOOD (  14.67  )
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

5ZyoIDIwMjMvOC8yOSAxNTozOSwgU2VhbiBZb3VuZyDlhpnpgZM6Cj4gT24gRnJpLCBBdWcgMjUs
IDIwMjMgYXQgMDc6NTM6MDhQTSArMDgwMCwgemVsb25nIGRvbmcgd3JvdGU6Cj4+IEZyb206IFpl
bG9uZyBEb25nPHplbG9uZy5kb25nQGFtbG9naWMuY29tPgo+Pgo+PiBNZXNvbiBJUiBDb250cm9s
bGVyIHN1cHBvcnRzIGhhcmR3YXJlIGRlY29kZXIgaW4gTWVzb24tUzQgYW5kIGxhdGVyCj4+IFNv
Qy4gU28gZmFyLCBwcm90b2NvbCBORUMgY291bGQgYmUgZGVjb2RlZCBieSBoYXJkd2FyZSBkZWNv
ZGVyLgo+IE9uIE1lc29uLVM0LCBvbmx5IHRoZSBoYXJkd2FyZSBkZWNvZGVyIGZvciBORUMgY2Fu
IGJlIHVzZWQgdXNpbmcgdGhpcwo+IGRyaXZlci4gRG9lcyB0aGUgTWVzb24tUzQgaGFyZHdhcmUg
c3VwcG9ydCBzb2Z0d2FyZSBkZWNvZGluZz8gSWYKPiBzb2Z0d2FyZSBkZWNvZGluZyBjb3VsZCBi
ZSB1c2VkLCB0aGVuIGFueSBwcm90b2NvbCBjb3VsZCBiZSBzdXBwb3J0ZWQsCj4gbm90IGp1c3Qg
TkVDLgo+IAo+IEFsc28sIG91dCBvZiBpbnRlcmVzdCwgaXMgdGhlcmUgYXJlIGRvY3VtZW50YXRp
b24gYXZhaWxhYmxlIGZvciB0aGlzCj4gaGFyZHdhcmU/Cj4gCj4gVGhhbmtzLAo+IAo+IFNlYW4K
PiAKWWVzLCBJUiBkcml2ZXIgc3RpbGwgc3VwcG9ydHMgU1cgZGVjb2Rpbmcgb24gTWVzb24tUzQu
IFRoZSBkZWNvZGUgbW9kZSAKY291bGQgYmUgY2hhbmdlZCBieSAnc3VwcG9ydF9od19kZWNvZGVy
Jy4KSWYgSVIgQ29udHJvbGxlciB3b3JrcyBpbiBTVyBkZWNvZGluZywgZHJpdmVyIHdpbGwgYmUg
cmVnaXN0ZXJlZCBieSAKUkNfRFJJVkVSX0lSX1JBVyBhbmQgYWxsb3dzIGFsbCBwcm90b2NvbC4K
T3RoZXJ3aXNlLCBkcml2ZXIgd2lsbCBiZSByZWdpc3RlcmVkIGJ5IFJDX0RSSVZFUl9TQ0FOQ09E
RSBhbmQgb25seSAKYWxsb3dzIE5FQy4KCjQ4OSAgICAgICAgIGlmIChpci0+cmMtPmRyaXZlcl90
eXBlID09IFJDX0RSSVZFUl9JUl9SQVcpIHsKNDkwICAgICAgICAgICAgICAgICBpci0+cmMtPmFs
bG93ZWRfcHJvdG9jb2xzID0gUkNfUFJPVE9fQklUX0FMTF9JUl9ERUNPREVSOwo0OTEgICAgICAg
ICAgICAgICAgIGlyLT5yYy0+cnhfcmVzb2x1dGlvbiA9IE1FU09OX1JBV19UUkFURTsKNDkyICAg
ICAgICAgICAgICAgICBpci0+cmMtPm1pbl90aW1lb3V0ID0gMTsKNDkzICAgICAgICAgICAgICAg
ICBpci0+cmMtPnRpbWVvdXQgPSBJUl9ERUZBVUxUX1RJTUVPVVQ7CjQ5NCAgICAgICAgICAgICAg
ICAgaXItPnJjLT5tYXhfdGltZW91dCA9IDEwICogSVJfREVGQVVMVF9USU1FT1VUOwo0OTUgICAg
ICAgICB9IGVsc2UgaWYgKGlyLT5yYy0+ZHJpdmVyX3R5cGUgPT0gUkNfRFJJVkVSX1NDQU5DT0RF
KSB7CjQ5NiAgICAgICAgICAgICAgICAgaXItPnJjLT5hbGxvd2VkX3Byb3RvY29scyA9IFJDX1BS
T1RPX0JJVF9ORUM7CjQ5NyAgICAgICAgICAgICAgICAgaXItPnJjLT5jaGFuZ2VfcHJvdG9jb2wg
PSBtZXNvbl9pcl9od19kZWNvZGVyX2luaXQ7CjQ5OCAgICAgICAgIH0KCkRvIHlvdSBnZXQgTWVz
b24tUzQgZGF0YXNoZWV0PyBQbGVhc2UgcmVmZXIgdG8gY2hhcHRlciAxMy41IEluZnJhcmVkIFJl
bW90ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
