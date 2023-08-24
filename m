Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61641C27C40
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y77fRCC86uLTlNG/H7x+4ddmioeiRo7T71G3EdmakNg=; b=bBpqoOyUhkRmN0CYFeskiLbAUN
	EWscBlhk8+m6l9A9Ac2dByLntsXy/EqUPFJqqNVmswIUlAJHGEIjcR2+XAiJPbLPHklLpE3Y45v80
	JqhVUNwz6uxCaqTudYwbIAwNeVEpub5RtWGluSsNWrk20UePBhM0bzdtzkoWAXPEEU4jmfV41igWI
	FrSV/K2CjYM9QFnSKR3iAVf3yC94Br3P9MgY4OAmSgTUL/139ATJE+STCdiswT55EatgLUo3c7+Yp
	eXvoI2OlRKAcmQ4lKW+ITsXMtmR+D3vY6SYkVFmWt69xk0utBbm0WQx1WNUPl7PTRbg8tH/XSQs1z
	w3MJWVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5m7-002ZnB-2A;
	Thu, 24 Aug 2023 08:33:07 +0000
Received: from mail-sgaapc01on20718.outbound.protection.outlook.com ([2a01:111:f400:feab::718] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5m4-002Zlq-34;
	Thu, 24 Aug 2023 08:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmcKxRY0id0xUMRMub1WjJOn716ilawNLxln/TTgPpHeKF36pDRECBrcSPmzkB2Knv3I2UsXMQyvgqDevMaUqqhbhunWtoKNmX7ELM/bv4pN/7hMTLd5gRKUAF5BkchUSAdP430M8EkgCd43/n6EXpXqG+TFzOfqQekK6bg7r/TPg9I3QmItLBhOsb6ZEyaT3iR3/P0Rjk1Us0Fa98fx6eDuxY1vngx/gK3/8Ugt1Xn3kQe0LuBQ4EmON+NnLLCf+qWHzCfR3r7nyE7U735uKTjEQYnsHXux601reD5v58kVwI5bk2MIGr38DAw7uM313OxvFr/CW9dpLg8dJUcTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8xz94yOzQvWDC3nEjlznyalu398+7Y9N+tEdDHc1Oo=;
 b=efcvRURX2PL5vBGmAXi0l9d+zer7zwKYTHJM7RIuF6Amls/PctefJDs/hZbX3cugRntjpsDv2ptNzn21nYh/gXBr7oJ1lqYlXw2jTBXkN/T8P7acXMh7+KfOwaIMYPIb25GV4Iyewiv9e8egy4MjEY3xTECHlyU5DrmcT7VbYQDBsuRQwaqo3rVePpw3g6vfTnLduUMybEYyMmLfJ/ADCBBSsLbI2Y3/HYWUaNLQBxApfh0xd37EAA3g1+B5ClKS1x7gS+SLZ5toEV2Fo6qVjinogWXOktWiKLaEOTa0fWba2xklJSul9l3wv/dLXE2CvzPIAhSiOL84bREZCT12gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8xz94yOzQvWDC3nEjlznyalu398+7Y9N+tEdDHc1Oo=;
 b=UOCQYNjhVKkSkH87TyL63mBeQ+d9S4c8J+MIg7UQdOjnd1rsv+szLfEs9XfyG9q6RzuBymg9Wqw1cLi07eA54IHWRgafoWIWmD0S7TKjB8gfgt1EkAtgbzMx5ewkm5Jjwt/t4W/evL72aVDJ4lLRUzGHkA9Vj13UWUMy0GGBaSMjQnF55B94hvMva5445KYcXpjg3uE+pk0YcXmRAE7iMpr1Rclm+7KeG7CtskNa6Ft/fYm0tVJm8grsD0IqzW5QfNN8v2ZmpErs5WitU9Xz0jehoMacBhp+1pQioecY61gkyvEGbv260sMIN4QAs7RmdZe49QFd0Lu3kCkzwWjBYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7337.apcprd03.prod.outlook.com (2603:1096:101:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 08:32:47 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::f065:6e23:803b:2a75%7]) with mapi id 15.20.6699.025; Thu, 24 Aug 2023
 08:32:47 +0000
Message-ID: <8dff604b-116f-4f61-956c-4ca2ab43babd@amlogic.com>
Date: Thu, 24 Aug 2023 16:32:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 1/6] soc: amlogic: modify some power domains property
Content-Language: en-US
To: neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-2-xianwei.zhao@amlogic.com>
 <cdab27cb-fea4-4f09-8a66-ce1aa1090186@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <cdab27cb-fea4-4f09-8a66-ce1aa1090186@linaro.org>
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 9123a2ff-fa23-4640-96f2-08dba47cb1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2575h0smmhEcNcPJMmcFbtQVzLLtTR8VDB1gIqS5i7d5TFLDKOHBg2jN0t5v20dV4woDU7WNmCLMxaryOxXFd92/SPrd0ZLcblsRyr/SG5xR5d3duKZFHpc/XDNaSrGzE9/eKdT+k7cNVW04RvS6SFOslqkDmpR9x306DOc3oeDszBB53Kbq32OOKW5VLl//tGAp5V/VkAwSy3WfMkWICxLHnOgswiZ4fWd3SQYxqLjf+DmV1tdLlV/9z2vPP1MDXHmgicMAmkN0kJRRzFOQC1N0EoGMDsBlSF4WNNh8Co63Fa7a5223w1Cd+IhhYnArJeBzUksSXOOSKjwar3FXAene31pRIhMb0bhf+XxoIjsMy7IpEJ36joDt1zCpA95RD0MwYa7L//h9iUZ30fJAY7o/1Ke4gMcodXEVKE2TJIl6ua1BKHZoBFpwRMF1/oBbF1EqQ/1Ml51+0U36iahuwZAZgvxWkNMCV0hTBrHu4KEZdkNl0JJRuGXWxS9xitGi/B6+yf2konlSAxFvIDNabshZty3ZDWKp2sODo7/eGl/q1Lu/0AgUjJhsc27ALeDGGs4+c1aErDuVN+oPOZ0zOb/moF2jx5KYDAzlqznvsF8obS9biZfU9eqWrBiEyES6WdMLre1PiIPh01E35H+rtEX7F9h7lXIu1B78+pI6B0WyHbCFVUqL5Wj9FNRcY3t90gnbpbIYZe4ptR9vlvahdih5cnoOY4PILl6lO/kJdXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39850400004)(346002)(451199024)(186009)(1800799009)(54906003)(66946007)(66476007)(66556008)(316002)(478600001)(26005)(44832011)(38100700002)(6666004)(53546011)(86362001)(6486002)(31696002)(41300700001)(6506007)(6512007)(12101799020)(31686004)(8936002)(4326008)(8676002)(2616005)(5660300002)(2906002)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3Y3SFhuL0V0aDlxeE1sTVdjc0lXL0oyYkY1bjlXdlJSV0V4Z2gxQW9rSXhv?=
 =?utf-8?B?YlRGK3RVa3ViRWJ6ejh4QllqZk9TT0kyb1JTd1VMdlBpL2pmVWtpWVFoZ3Zs?=
 =?utf-8?B?TVVmMEEzUEorQW1MSTBUb2ZaZ3hkc2QrME1QV2dUTytYWnhJQU5MaGFxQ1Zu?=
 =?utf-8?B?UVhZK3B1MEpTYTZHNHRSaGJTRENEbVhKblRLbm5FOGsya0NoZ3VLMmYvVUVX?=
 =?utf-8?B?S2NtTGY4YjB6azdxeEE4d2JqM0s1OFZScnVGNjloZnhCaDlSVXUyTWE1YkhZ?=
 =?utf-8?B?MVRiVXBmb2xrWFlDejFtZUxlcWVyVkJneUNaNUw4WEVXZXFUSW53L05WSHN6?=
 =?utf-8?B?UHJaeFY5RU9Yc3YvcTNjbFlwWUZsa2JnOGRPUktpbCtNdUx1dkszd2RHQklv?=
 =?utf-8?B?TzY3WmUxaDl6bE1pakh0MWN5dkFDWDlFU1drNDdBOXFVc1JhNVR4bFNHS1Fu?=
 =?utf-8?B?SGpQWnM3V1lzLzIyTGk1cmdCaTNKeEZydkNGa3ZTcDJjTmVBK2J6RG13RzJH?=
 =?utf-8?B?RGZoVGlrOWRkYmRHaTV5eWMyNFhwMTBjTmdwRkVqNzhJMmJqa3F3TmRIYWxt?=
 =?utf-8?B?MFNwSEFPTDlETWthd0tPc0I2NFRISCtsTXNLZzVNQjc0YXRkalp3WU5XMXM1?=
 =?utf-8?B?K3I5eUFCbjFuMHdKU29QcWhheGZ4RnlqY2hmeVBKUE85RGtBU2t6OEhadVE2?=
 =?utf-8?B?WE9rVTdHb0p2Y3dtN1pBQTVRTzgxOGYvbnRKVmNUKzU1R0dNaVVNUHNQS3d1?=
 =?utf-8?B?cFFIOThNWlVYaklDVXhNWUVTbHgrT2JKYjYvUWZ2VzZwRnJBQzhlNEdZWHlW?=
 =?utf-8?B?enZIODllaG5wYlpBbXRneFh6NHFGY1daNlZPanNSQmJLcWFMamdkUHcvbXdP?=
 =?utf-8?B?NVd1NjFMRUJSbWJCWDA1SXZYNnJFbWFpd3pkR08rYjYvUWk4YkFzekxoU0NJ?=
 =?utf-8?B?ellxbFN0b293TU03ZHpTaEFXS2FVN3lTZlA5b3QybmRQWnNJT3RmWGRnZDhq?=
 =?utf-8?B?RENwclE3L01Ka0Z2bWJSRVlvays1RDgvUEdhaUwwMEl1elYzdmtybHp5dDJ0?=
 =?utf-8?B?Ykk5UEp2VGZKMExKSWRmRzJPRlkzYmlzdHNJeHVvbkdidE5obXB3aDRQTURV?=
 =?utf-8?B?QWZYVThpYVFWMW13RDIzN1Erd2xEbWJoWkZzTXRtSmE4a0ZEbW1kRlo3L0RN?=
 =?utf-8?B?cW1qbS9IT2Nzd1Rla1pKNFFlMnZiQTkyd0x1Q21tVWFpSHQvOUl0OVd1ZEwz?=
 =?utf-8?B?SkRDSmVoNGc0SUJNdDRmUzYyWFZObDhFUnRScG41QlZKZUZ3emhXcjhmUFB4?=
 =?utf-8?B?VHE1NEM2ZlhOelgvZGF3TWlqd2wrMTEreFBiYmJzUGFxd2hIdG5UZ1VlMVIz?=
 =?utf-8?B?SGoxUVhNQTI2UGxWNGlTZXNrV3RrNEJrVldBSnY0NUtUWS8ycWJCRnhiYmFE?=
 =?utf-8?B?R2tEZEVUUVFQTm1rRjRvV1h4VHRmZkhHSm9sUkNPSW9PQ1NpS1d3amdWZEpa?=
 =?utf-8?B?Q1RlZ1JtM3RIUy9HSnhMUzBFdjY4RVFETWVxTGxmMDNOaTJpSjVtY0tueG5h?=
 =?utf-8?B?V3JEVlVsY2txbUFvMmlBRUV4aHVqTTNqakZXa2tTYmNLbmcwWkdhUFNJcnE2?=
 =?utf-8?B?QWx0ZllDZVVqNmZNaUtmdmlKREJQeHVSYWdON09zQU1teFlVNWhFZG1hazVV?=
 =?utf-8?B?eW4zcU94ZUFpNFdYQktBYkQwYzZ1SW1CUUdoK3laTThVcUZtVEc1cUwyY0dW?=
 =?utf-8?B?dFZvaFF2aGNXMVFEbjFLN0VJdUNiQW4va0d2VkVxdVpsVFMxMCtVd0oyMXVV?=
 =?utf-8?B?cS9qdFdId1k2MzdDaDNrZkl5M3prcHV1OFM0enZ4V2JkYTBDc0tSUGJ2MmNT?=
 =?utf-8?B?QmVyWnEwNzRPNEpqQW0zK2xTM1pHeVZHUVdheldNb2ZMSDF1YVBHN3dnLzJ1?=
 =?utf-8?B?NmgrYm1FNVRJY0hxVDB3QUZQOTM3b1lSVUQyZlRGb3BRMlM2ck03Q2V2akRq?=
 =?utf-8?B?ZlZVQ1R1dWdFbkhKVi9HdVlDUWhCNWg5SURZWkhBWnZNU1FSditYbnZtTUFv?=
 =?utf-8?B?TFNadThnUndHN1FUMTN6bzBpRXhRNFpoUVhjeS9UeFF2NjJuWkhsNjJwSHpi?=
 =?utf-8?B?S1lvN0ZkNzRXU1JFOEdXaEFwejN5M2VsSjB4aStqTnhaRzBmUzR1bThkM1hs?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9123a2ff-fa23-4640-96f2-08dba47cb1e1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 08:32:47.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dD4Jb3r6kELq+yBdZ00vG9Tf2GuzasS21noI0ERBTu8dAYye9Oc2xw6AVqYkIfnEXVy+eyEqMdJnMgCu/mRV9bjIX8hWrZRWM2Kh8XW53wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_013305_052941_2B28A81A 
X-CRM114-Status: GOOD (  15.60  )
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

SGkgTmVpbCwKICAgICBUaGFua3MgZm9yIHlvdXIgcmVwbGF5LgoKT24gMjAyMy84LzI0IDE2OjI0
LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAKPiBIaSwKPiAK
PiBPbiAyNC8wOC8yMDIzIDA3OjU5LCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+IEZyb206ICJ4aWFu
d2VpLnpoYW8iIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Cj4+IFNvbWUgcG93ZXIgZG9t
YWlucyBmb3IgQzMgY2FuIGJlIHVzaW5nIHJ1bnRpbWUgUE0sCj4+IHJlbW92ZSBBTFdBWVNfT04g
cHJvcGVydHkuIEFuZCBhZGQgc29tZSBwb3dlciBkb21haW5zCj4+IGRlc2NyaXB0aW9uIHdoZW4g
QUxXQVlTX09OIHByb3BlcnR5Lgo+IAo+IFRoZSBzdWJqZWN0IHNob3VsZCBub3cgYmU6Cj4gZ2Vu
cGQ6IGFtbG9naWM6IC4uLi4KPiAKPiBzYW1lIGZvciBwYXRjaGVzIDIgJiA1LgpXaWxsIGRvLgo+
IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiB4aWFud2VpLnpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2lj
LmNvbT4KPj4gLS0tCj4+IFYxIC0+IFYyOiBOb25lCj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dlbnBk
L2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMuYyB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0tLS0t
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ2VucGQvYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdy
Yy5jIAo+PiBiL2RyaXZlcnMvZ2VucGQvYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jCj4+IGlu
ZGV4IDg5Yzg4MWM1NmNkNy4uNWFjMjQzN2FiOGFkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dl
bnBkL2FtbG9naWMvbWVzb24tc2VjdXJlLXB3cmMuYwo+PiArKysgYi9kcml2ZXJzL2dlbnBkL2Ft
bG9naWMvbWVzb24tc2VjdXJlLXB3cmMuYwo+PiBAQCAtMTIyLDE4ICsxMjIsMTkgQEAgc3RhdGlj
IHN0cnVjdCBtZXNvbl9zZWN1cmVfcHdyY19kb21haW5fZGVzYyAKPj4gYTFfcHdyY19kb21haW5z
W10gPSB7Cj4+IMKgIH07Cj4+Cj4+IMKgIHN0YXRpYyBzdHJ1Y3QgbWVzb25fc2VjdXJlX3B3cmNf
ZG9tYWluX2Rlc2MgYzNfcHdyY19kb21haW5zW10gPSB7Cj4+IC3CoMKgwqDCoCBTRUNfUEQoQzNf
Tk5BLMKgIDApLAo+PiAtwqDCoMKgwqAgU0VDX1BEKEMzX0FVRElPLMKgwqDCoMKgwqDCoMKgIEdF
TlBEX0ZMQUdfQUxXQVlTX09OKSwKPj4gLcKgwqDCoMKgIFNFQ19QRChDM19TRElPQSzCoMKgwqDC
oMKgwqDCoCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+IC3CoMKgwqDCoCBTRUNfUEQoQzNfRU1N
QywgR0VOUERfRkxBR19BTFdBWVNfT04pLAo+PiAtwqDCoMKgwqAgU0VDX1BEKEMzX1VTQl9DT01C
LCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+IC3CoMKgwqDCoCBTRUNfUEQoQzNfU0RDQVJELMKg
wqDCoMKgwqDCoCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+IC3CoMKgwqDCoCBTRUNfUEQoQzNf
RVRILMKgIEdFTlBEX0ZMQUdfQUxXQVlTX09OKSwKPj4gLcKgwqDCoMKgIFNFQ19QRChDM19HRTJE
LCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+IC3CoMKgwqDCoCBTRUNfUEQoQzNfQ1ZFLMKgIEdF
TlBEX0ZMQUdfQUxXQVlTX09OKSwKPj4gLcKgwqDCoMKgIFNFQ19QRChDM19HRENfV1JBUCzCoMKg
wqDCoCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+IC3CoMKgwqDCoCBTRUNfUEQoQzNfSVNQX1RP
UCzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+IC3C
oMKgwqDCoCBTRUNfUEQoQzNfTUlQSV9JU1BfV1JBUCwgR0VOUERfRkxBR19BTFdBWVNfT04pLAo+
PiArwqDCoMKgwqAgU0VDX1BEKEMzX05OQSzCoMKgwqDCoMKgwqDCoMKgwqAgMCksCj4+ICvCoMKg
wqDCoCBTRUNfUEQoQzNfQVVESU8swqDCoMKgwqDCoMKgwqAgMCksCj4+ICvCoMKgwqDCoCBTRUNf
UEQoQzNfU0RJT0EswqDCoMKgwqDCoMKgwqAgMCksCj4+ICvCoMKgwqDCoCBTRUNfUEQoQzNfRU1N
QyzCoMKgwqDCoMKgwqDCoMKgIDApLAo+PiArwqDCoMKgwqAgU0VDX1BEKEMzX1VTQl9DT01CLMKg
wqDCoMKgIDApLAo+PiArwqDCoMKgwqAgU0VDX1BEKEMzX1NEQ0FSRCzCoMKgwqDCoMKgwqAgMCks
Cj4+ICvCoMKgwqDCoCAvKiBFVEggaXMgZm9yIGV0aGVybmV0IG9ubGluZSB3YWtldXAsIGFuZCBz
aG91bGQgYmUgYWx3YXlzIG9uICovCj4+ICvCoMKgwqDCoCBTRUNfUEQoQzNfRVRILMKgwqDCoMKg
wqDCoMKgwqDCoCBHRU5QRF9GTEFHX0FMV0FZU19PTiksCj4+ICvCoMKgwqDCoCBTRUNfUEQoQzNf
R0UyRCzCoMKgwqDCoMKgwqDCoMKgIDApLAo+PiArwqDCoMKgwqAgU0VDX1BEKEMzX0NWRSzCoMKg
wqDCoMKgwqDCoMKgwqAgMCksCj4+ICvCoMKgwqDCoCBTRUNfUEQoQzNfR0RDX1dSQVAswqDCoMKg
wqAgMCksCj4+ICvCoMKgwqDCoCBTRUNfUEQoQzNfSVNQX1RPUCzCoMKgwqDCoMKgIDApLAo+PiAr
wqDCoMKgwqAgU0VDX1BEKEMzX01JUElfSVNQX1dSQVAsIDApLAo+PiDCoMKgwqDCoMKgIFNFQ19Q
RChDM19WQ09ERUMswqDCoMKgwqDCoMKgIDApLAo+PiDCoCB9Owo+Pgo+Pgo+PiBiYXNlLWNvbW1p
dDogNDEzZjVjMDI5MjliYjMzMDQyYmJjNGVlMjMzMTY2NTUwYTVmY2E3MAo+IAo+IFdpdGggY2hh
bmdlZCBzdWJqZWN0Ogo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
