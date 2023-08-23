Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C08EE49AB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 06:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UWzJCy06Qvz48kUq+MweKBIu4IKmbIKZG3JaQrz4ic=; b=RByu/SpI574fSrfDGBOJfpMTRX
	9fr3Sph0ow/0AhXRE87WSvmjiBurgHc3jJaAJ83BL0CKQgfDSms9CEJvPE5a6NQu2qPz9onzbnptN
	AAgX1PoNns8R7KIMFQEquUF55rICP9nNX3XFLNzat0iOV1KvxIJi2pwf8gMqI1rF2Nkp/tDMrllen
	2gKHg2mtobAr8VXdY1WmIysSbvIByLR2FJj+PQeIpHqUz/e5pih6ruPbKyN4fNhUE/uRnByxCAj2E
	K0ofdVGF/owUQLIC690cPo7XGVkJL0aq9T/8ExNFDXwe04TAS/YLa96I8fs41F90xuLn3WOaypiKK
	VTIDZUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhTT-00HOzX-01;
	Wed, 23 Aug 2023 06:36:15 +0000
Received: from mail-tyzapc01on20725.outbound.protection.outlook.com ([2a01:111:f403:704b::725] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYhTP-00HOyU-0V;
	Wed, 23 Aug 2023 06:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3J+AowXLD5kKu+W+Xn7/VEm+OLLWHYNzR3iAErRQTraM5FwgzJwwvduYhPbTG2b4FG+9lOe2QV3zszc3jnIC2sP6aBkkS/G0RnFx/Rok8v8bSuT7dx93a4RaiN1GUBIXzrbw0GI5Rntk9ZQi7PXwr1DdHmjsETR+MTGLdTY9RObsQvocdtU7esjhd8Mr22yRkDLlcx55nsZfjJE7NqAu/3vVSeN0wWa7w4uTAs3TDwLLnWj2ScDi0JiwmiLJSXTji8oQe3DTfrEozA4TbUOezCQ9RalXc6qVsPFz9f71dZw2OfKbDMu6ONislXyiv4ueGIrEPm8u4CZ2n686y4bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDqeIAerwMCVsfRmXiqbd6CbesupNZFLDot9zRpJvvY=;
 b=UcXmNGEb3GLChCQG5jK4br8yLjLFjg6QfyzOAT7jeU3t03GyY5nolcP8YzVTjjVdKzpaVi5PlKMMxxG58cnnTKbd8eWJB9cjAA20CUghSsJ9i0iFHaAGcBYI1yykAwN9O5TdBtm/1QhEllk/IPp1yVbv2SdbDNSQyVfpZ6gbdK2BGk6/1pRanM7TIwW2TDZ4C5JzaZ2tbWbj+XANtjXn8sj/I6exXl55kE6fyPllM/qer9JgttL83tE2e1JWzQdcKA5bLsRVCHFl6ahId2NZsKqjo8oRdQgN8ywMVVaCW08kzUHD5qO8Uvpw2l+IobnTOxKHXAmQ4fXj2gXhrwJzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDqeIAerwMCVsfRmXiqbd6CbesupNZFLDot9zRpJvvY=;
 b=bOQ3J1L3yfhjSUZ4infDioWOzx0aeJ1qKL9Nod9eBBkpI+L5HUssojrs2QbLERKb4C2CSp1c8e/yzuGwlrjh6xKaOffn7fW3g+85rQARXzaS7RvqyLX6G7kj5wxpEYcXS0DXcMfwUUZQr0E8yoyME/iau/XNZuoDMRasMbe5rZoTjty24VMRPky4eRHx1nh47+gN6j8UdSsDqH/C3P4s2PRt5DALiiRQIs8ZRcX2/EyPN130Nn4lJQvmafdZ4t9I7Veo5+rZ0Hvmaf4Ok/F+dNnQ3/wrLv2t8oGhMLiXEFUZuvETI1FeLeHna10IqLb7QwUvRT933F8NKeXmFP2Y5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com (2603:1096:4:1d5::9) by
 TYZPR03MB5405.apcprd03.prod.outlook.com (2603:1096:400:3c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.26; Wed, 23 Aug 2023 06:36:01 +0000
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::6f04:4b62:1127:59ed]) by SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::6f04:4b62:1127:59ed%4]) with mapi id 15.20.6678.029; Wed, 23 Aug 2023
 06:36:01 +0000
Message-ID: <754de03e-2601-5696-c07c-caef88b974ef@amlogic.com>
Date: Wed, 23 Aug 2023 14:35:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V10 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-2-yu.tu@amlogic.com>
 <d2a6060a-c8a0-51c7-f621-1bed2c3074b4@linaro.org>
 <e9932f90-a011-ee9b-ef09-f2e2475bdd0d@amlogic.com>
 <c2faccd6-1d77-9b81-d8d9-830e95e804af@linaro.org>
 <eee9e730-f69b-1150-07fe-0d40a14b5a50@amlogic.com>
 <4db8ba95-0d0d-0d1c-1d90-29833f0405ae@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <4db8ba95-0d0d-0d1c-1d90-29833f0405ae@linaro.org>
X-ClientProxiedBy: SG2PR06CA0215.apcprd06.prod.outlook.com
 (2603:1096:4:68::23) To SG2PR03MB6730.apcprd03.prod.outlook.com
 (2603:1096:4:1d5::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6730:EE_|TYZPR03MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1a96e5-2d0f-4f26-6b7a-08dba3a337aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hT501QmqJIFytAaQgFJ4IWXH3mfZBR0jbh0/0IYxVNrmwwKJrqmXVr7RdE9QSxsLAhbIa10rJjXa0DlHA6qWOgKypr3bdt0V5/P50i2lOXToLrTq9H0fB1SsARYOL9ttP2Uvoz+fWXF2t4UpnRsc1YXVByQxg+HmmNbRKKvGsfwsqz83LwpgqxTQ7gi/3wJW2NmikKYHRl3qdaqDwL2jZ5aq9jZd45n9DpHk2S8HNL3uvpoHrlEhzaoGfNxERlGlLZ/KxzIUGdv9nD+9vQX39gtBCbUEaYp1u2VKQlbsgyX6lHM9PIs74dVDXobtxJfIXuMc9qhD3dfwQn+e4l/HUkQShFqOmupdEo7KKmXNTyQfnOIiqodc+kTvVm/QBHPA1gxq4uFn6ThISzXjGOhY9DmSVChlzN2OxsVAZXm3+IPdflasaBMezIBlfMRLrcc/kM10/fs4kHepqOZ4YVp9WjplzmZmew43gkwdl+McoGMFbhBi3ae+sDWe4699vsd2sMSqFTR/aqVzSC6FnSWcXa4+/kSMOzbLnnvihxUa3239BmLUE6Ic68e8W+prFjChz83RMsp/2Dh84g7jBAlrJBkpQ091W0LCLQC89Epfv1+oVeFLjwUY9rHc4Ydi+NKs3XDynoRyni29tCMpsIKymYM9avkmPscl7VpMeLxxK5kRA9nNVTtegCLWH/4bTv4lSn2d9tTS5tgxyRcEhcquEcHjJM9zESSmdMKVYNBurlvl8Ww39Xz91RsKmePtmxlZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6730.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39850400004)(186009)(1800799009)(451199024)(6506007)(6486002)(6666004)(53546011)(6512007)(83380400001)(921005)(86362001)(31696002)(38100700002)(36756003)(26005)(2616005)(107886003)(2906002)(316002)(66946007)(66556008)(66476007)(41300700001)(110136005)(5660300002)(12101799020)(44832011)(7416002)(31686004)(4326008)(8676002)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUw3eGNLLysrWXVPS1RNRWVtUDNsOTg1ZC9mZlo0Wm9kR00ybmZMYlNqSGR4?=
 =?utf-8?B?YVRwOE4vT2VuSWV5TDZUM1J4QitZWC9WMkF3UnA1ZGNYSjg3YWJ5cFdSSEdG?=
 =?utf-8?B?NG9UczNtNThjak5ZL2gvOXlzbXJIT2czS3REUkd5S3JPOGFQak9qZ3FqckpK?=
 =?utf-8?B?anpsMHhDTzQ0cDNhUDlFaGlYTzJTaTEyVjFwejBseUwrZE5rbXBDTDFWdlB5?=
 =?utf-8?B?QzkvM1pGdXRxWHplM0Q4L1pTSWlUTHFOSEVJYXZScUMxMlQzSFp1M0tyblcz?=
 =?utf-8?B?TzRwU25jMUFyRTl2MkRkYjF2STRUeGdSNVNSNDUvdms0YWlxWGtaTW9uVWRv?=
 =?utf-8?B?c1hhYXUvaVdNU0dySTJjTjd6Y0tHWHNiUklOWE9xRFNzL0JBdE9KYnJhOVBZ?=
 =?utf-8?B?cDRhWVNJV3F3Q1pyeWR4RWZKdlljOUNleUlmOVFPVEpJQjVra0dkNWs0OGxn?=
 =?utf-8?B?OHZyTTNMWGJoWDFvUVRNd2F5RHI4UnI4RjZQV2xvRk1HQVdhNUhRekpMZ2g5?=
 =?utf-8?B?VGo4b3hoYm9zUWVpMGJwL3ZwSWNCR1Brd2xiMU1MY1pnYkRlVDZqT0ZBNzI5?=
 =?utf-8?B?WmdQbGhaR094MWk5WXlaZjdHaFJiUk93QU9VQVU1L3R2MW9kWUF3ZUt2RE13?=
 =?utf-8?B?NVgvcE1UeElXZkNhRFByM3o5T3d2TW1mSWJCZGVBNllmOGdQK1E5bHA4ZlBU?=
 =?utf-8?B?SlV6RnB3bkpmMkRIV1Z4dmNKTUljNDFiWUFzNVdvTjQ2Uk1ZSFVpd0xPaVhJ?=
 =?utf-8?B?WnFJSHNIOGxWaDJZN3pqZjZUZ0M1bWlXS1RiY3N0alJCVGlMWlUzUWRGRXNa?=
 =?utf-8?B?V0w4d2JKUnEwRHU5WjdTUEtqR2RISUNCT2pnOHhWYmJWWUpoSStnMUxmbnlx?=
 =?utf-8?B?TExoRkhXQUs1eXdKVkd1NzFYYlhidExnWndPSXVOczJyRlZuNUdEN2JCK0tq?=
 =?utf-8?B?bmZXOW9wTUdyMUlKdFlJZXRKSjljaDQ4eUtVSVIxcHRsR0FFWUZoa0g5cEZn?=
 =?utf-8?B?cUg4WlhuZWNlYVlhR2NpWG5sYXplcjhjY3lDaUxUbnR4bzNSTytvU3hjNjd5?=
 =?utf-8?B?Q3dQd2dtM1kxZkUvWUJkL1lwcEZXN0syaGZieHlsb0xDTWRrOS9hYlp4RDBG?=
 =?utf-8?B?SUNhOTUrM3A0SjlLN1FleXVLUVJROHVZSzFvY29KaTArZXdhUFNiWlNMbktM?=
 =?utf-8?B?WmZDOU1lQ21ReVJadUJ3MHBNK0xoMFBMZDVSY0tDZ1pwcThPYVFFK2JNMTlF?=
 =?utf-8?B?MTFSWFh3ZHluVFRrbk4yRDUrMlZWK2wxM2Y3dTZkVWRLOU10Qnp1eTFtRG1l?=
 =?utf-8?B?S0I5dEgzTjBVSS9UOHl0SDl4U2huV0I2NVVwZzlEUkZKQ2xZbFowQkJHU091?=
 =?utf-8?B?YkZHdklhWld0Mmg3UVd6WGU0S2pZVUJNd0dHYU5HYTlvL3loZFRPdHVtdG9S?=
 =?utf-8?B?QXJlSEp6VVpTR0JqLzhGeGxqVWE5VmpOYS9aaDcwSzZvbW1NS2hMMEpKdHVX?=
 =?utf-8?B?eUZYSVRCcll2N1hIRnJLVEpsZG5sdURzdHY1TVNiZUhXcXlxZDc0TUpkNDlt?=
 =?utf-8?B?bFBMWDVvdXFBUFVlQTRHUU1tdVp3aytnZEtjU3hndVc0dzc3MjdNRDhJbDYy?=
 =?utf-8?B?REpoY1M4RGprdi9icmdIdnlHMytCcFlTOVcvc3JkM2pwVDdjRmdGTTNJS25v?=
 =?utf-8?B?RHBNdjVuWW8zdkZqTzdUeHhNSEJDK0x0emUzUzRMZnJkSEFVeEYvV3dxUkZj?=
 =?utf-8?B?dlBxdTVudExFTndoQlFBbHI0K2dyMGtXQ2FjOEQ4RHMzUndjSXBRV1NCNDZU?=
 =?utf-8?B?VWZXZkNONmpaa0I3ZWtKdGhKTzd4RUpEdXRnYkwyZDd4ck5paG9yb2xrSkhZ?=
 =?utf-8?B?WEw2SlNUZDZRU3F0a1RmRStkUmtTZ08xSW1oanZ1WmRpOUthUlpTRjlhMHNh?=
 =?utf-8?B?R3hDTmt3a0MwT1pvck9UbVR4bndRYmFQb3JxbGNpSExWRUdjZ3BpTUJMOSt5?=
 =?utf-8?B?VHc3N3dwMllOV2UvdFk3YTNmdnJBMmRVVnVsaE9nMngrVDFHK3M3Q2o2TU5s?=
 =?utf-8?B?WTQweGxoVERmcVRiZzg4QzAwRDgxb0p3WTNNWGdCWFZVMTExNHJSTWlQYXZL?=
 =?utf-8?Q?ofH58kJ0yynu8INa1Dh20scRq?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1a96e5-2d0f-4f26-6b7a-08dba3a337aa
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6730.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:36:01.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ys9McPOh1BzwPuDOyvFruk6n9l4D8TjziBMuI3sqha+TPH8agdawOZ7HuOBQGTDcb7TgU1noF+uuNIOimhmRiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_233611_218571_97BFC1E7 
X-CRM114-Status: GOOD (  17.72  )
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

CgpPbiAyMDIzLzgvMjMgMTQ6MjcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gWyBFWFRF
Uk5BTCBFTUFJTCBdCj4gCj4gT24gMjMvMDgvMjAyMyAwODoyMCwgWXUgVHUgd3JvdGU6Cj4+Cj4+
Cj4+IE9uIDIwMjMvOC8yMyAxMzo0MywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+Cj4+
PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiAyMy8wOC8yMDIzIDA0OjI0LCBZdSBUdSB3
cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjAyMy84LzIzIDA6MzIsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+Pj4gT24gMjIvMDgvMjAyMyAx
MDoyNywgWXUgVHUgd3JvdGU6Cj4+Pj4+PiBBZGQgdGhlIFM0IFBMTCBjbG9jayBjb250cm9sbGVy
IGR0LWJpbmRpbmdzIGluIHRoZSBTNCBTb0MgZmFtaWx5Lgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4KPj4+Pj4KPj4+Pj4gTG92ZWx5LiBJIHNl
bnQgeW91YSAgZnJpZW5kbHkgcmVtaW5kZXIgYXQgdjggd2hpY2ggdHVybnMgb3VyIHlvdQo+Pj4+
PiBpZ25vcmVkLiBZb3Uga2VlcCBpZ25vcmluZywgSSB3aWxsIHN0YXJ0IGlnbm9yaW5nIGFzIHdl
bGwgZnJvbSBub3cgb24uCj4+Pj4KPj4+PiBIaSBLcnp5c3p0b2bvvIwKPj4+Pgo+Pj4+IFNvcnJ5
LiBJIGRpZCBub3QgZm9yZ2V0IHRoZSBmcmllbmRseSByZW1pbmRlciBpbiB2OCwgSSBjb25zdWx0
ZWQgeW91IGZvcgo+Pj4+IHRoaXMgYXQgdGhlIHRpbWUsIHNvIEkgcmUtc2VudCBWOSBhZnRlciBh
ZGRpbmcgdGhlIHRhZy4gQmVjYXVzZSBpdCB3YXMKPj4+PiBqdXN0ICJtZXNvbiIgdGhhdCB3YXMg
cmVtb3ZlZC4gQnV0IFYxMCBpcyBiYXNlZCBvbiBOZWlsJ3MgcGF0Y2gsIHdoaWNoIEkKPj4+PiB0
aGluayBpcyBhIGJpdCBvZiBhIGNoYW5nZS4gU28gSSBkaWRuJ3QgZGFyZSBhZGQgaXQuIEluc3Rl
YWQgb2YKPj4+PiBmb3JnZXR0aW5nIHlvdXIgcmVtaW5kZXIuCj4+Pj4KPj4+PiBTbyB3aGF0IHNo
b3VsZCBJIGRvLCBJJ2xsIGZvbGxvdyB5b3VyIGFkdmljZSBleGFjdGx5Lgo+Pj4KPj4+IEkgZG9u
J3QgdGhpbmsgdGhlcmUgd2FzIG11Y2ggZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB2ZXJzaW9uLCB3
aGljaAo+Pj4gcmVjZWl2ZWQgdGhlIHJldmlldywgYW5kIHRoZSBjdXJyZW50IHBhdGNoLiBPdGhl
cndpc2UgeW91ciBjaGFuZ2Vsb2cKPj4+IHNob3VsZCBzYXkgdGhhdCB5b3UgZHJvcCBSYiB0YWcu
IFJlYmFzaW5nIG9mIHNvbWV0aGluZyBzb21ld2hlcmUgaXMgbm90Cj4+PiB0aGUgcmVhc29uLCBz
byBwbGVhc2UgZGVzY3JpYmUgd2hhdCBhcmUgdGhlIGRpZmZlcmVuY2VzIGluIHRoZSBwYXRjaD8K
Pj4KPj4gVGhlIGN1cnJlbnQgcGF0Y2ggYW5kIFY5IHBhdGNoIGRpZmZlcmVuY2UgaXMgbWFpbmx5
IGJhc2VkIG9uIE5laWwgcGF0Y2gKPj4gSSBwdXQgImluY2x1ZGUvZHQgLSBiaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmgiIHRoaXMgZG9jdW1lbnQKPj4gZGVzY3JpYmVzIHRoZSBj
bG9jayBpbmRleCBhbGwgZXhwb3NlZC4KPiAKPiBBZGRpbmcgb25lIGluY2x1ZGUgaXMgaW5zaWdu
aWZpY2FudCBjaGFuZ2UsIHRodXMgYW55IFJiIHRhZ3Mgc2hvdWxkIHN0YXkuCgpJIGdvdCBpdC4K
Cj4+Cj4+IE5leHQsIEkgc2hvdWxkIGFkZCBSb2IncyB0YWcgYW5kIHJlc2VuZCBpdC4gSWYgeW91
IGhhdmUgYW55IG90aGVyCj4+IHN1Z2dlc3Rpb25zLCBwbGVhc2UgdGVsbCBtZSBhbmQgSSB3aWxs
IHN0cmljdGx5IGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb25zLgo+IAo+IEkgY2Fubm90IGFkZCBzb21l
b25lJ3MgdGFnLCB0aHVzIG9uIHlvdXIgbmV4dCB2ZXJzaW9uIHlvdSBtdXN0IGluY2x1ZGUKPiBp
dC4gSSB0b2xkIHRoaXMgbGFzdCB0aW1lLgoKV2VsbC4gSSByZW1lbWJlciB5b3VyIGFkdmljZS4g
R3VhcmFudGVlZCBubyBlcnJvcnMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCj4gCj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
