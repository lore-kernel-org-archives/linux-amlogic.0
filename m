Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DD1C54E60
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2024 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBZDEoatTK7EDnAukGaIMjIuCLARWoR+gzCAqxX1+Bw=; b=p2QAgTcoulpC0yA2NjHQ5wPyq7
	mJBo7tCMK0eeXfGygCppHvxHQ4+sPlmSJtdnAantfKOWD9EqADsytkylo0OS1xCSGo3mQP5UjpVeE
	3aPos6fxoX3Nt3M1QkDJNHSoV0UNGph0OQWalmwSByOs0jw/VISlL8pAznj6FoRElhUezpzylDZWF
	5jLRQ10yIYSlC5TT5I2hpSHFuQ8ew8AcYgIdREFZOYWI6qtp2klTpZbtg+jRrLikSRqCwcUZQq375
	r6+cpdvgb5fg1E5T6B9E75EhQRKdaF9M8G97y+3coJKeu0IIfy6SLFdxl5UZMOHqw4nUxRmfCq/jh
	4S+DzwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLAq-00000009Xd2-2PSR;
	Wed, 13 Mar 2024 09:45:24 +0000
Received: from mail-psaapc01on20722.outbound.protection.outlook.com ([2a01:111:f400:feae::722] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLAf-00000009XZ4-1Xpe;
	Wed, 13 Mar 2024 09:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIEfox3uVDNRAs6BZOH+AI0AZB+razNGnNIc4poeV6hkfAN3HEHGrmzLcOggSlEDo1xiixTDdaUGQFdBpyMeKiDqW9rCGKb2rPgnnXhmW2WNzTFBG5Hroe+Ww7ntw6E4+1SDD6Y9Tu6PsyMYrKI3LX+s+7Vy35Bpfy68SYjMahwOLDoGQdmVhAm3aq3oFviCyOK4nhDtX2k9smx/02M/svzAKcYguAYerJ+jTMK2VSq2O4LAylutGWaohkX7GOH4W+Ph+A50ZX+5jJszh4wmGJ+jz1pocKQWwwkLOY1cnDXSL0lmvkhlT5iLCkJx1vWrFLc2akQBzd0+gLJFJ9xywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StOBkhOG2qgOBIpaJPpNQCYl5qCEmHIlD868Ydd6fQ4=;
 b=XjDJhWV2Wnx/LOYfiYapkRJOjtUtr0aFKGX40L7OpqrPVJRZFruIzvPcIP8JhzJFC7FTKYpkjsewOnhHBqgkPYBJjkR+NSsSdm1iieYgC6sQ5bHXkBpPKk8adwDUOvmOt2A2b9CsqLDLt8z2PEOntNCwzlhm27Gdnr4ISq9cUG+DMA7yaa9gj0Ms1On/4ZnRLiU0IsWONAPZqb9s5ZKgT0ZIXIziAW+YOhnKpJPmIAl8a208ZDIXr/Ky/3WaT17qB/BPy16URb5ZWRz+6O0m1og2Cqk6z0gs1mTVKIDr9KLRP04sRr9pYEk9aUY6XeqmWmm+MaxCYbm8g2v7JPoZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StOBkhOG2qgOBIpaJPpNQCYl5qCEmHIlD868Ydd6fQ4=;
 b=xjInR158NmE+BINLkc1ChgGU4K9tRiG6wnEmuI33WvusgrPEziPpadx27g5n6bhQ+vOuSEKvB24grzNGK6lAnGIxrme93yjo+Cf7dGsBxQlm3yBh2YNd30U/6EK58LTx3LXzod6UmgHaJ5QKQKqFV8uuz/eOMohbPvBmnVCs0njPXxlgQ1m/i3pmGcYoM4uuELFWmeW5ENUg/CgvkYnswuj5VYrl8VjNfxm8HSM5qj8VlqBlPOm50M4tdgAFtDu5cud56ttaB1HD+0Z94aGWIpV0OzpYdScKtPALjkJHuuDX+GpHSqOZIsadZqE8DEf587VRUUbQXMIVfG37AhfHGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB8033.apcprd03.prod.outlook.com (2603:1096:400:45a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Wed, 13 Mar
 2024 09:45:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::5198:1b2f:8889:17b]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::5198:1b2f:8889:17b%4]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 09:45:04 +0000
Message-ID: <ed347191-31ed-4358-a17f-83fcffd23a10@amlogic.com>
Date: Wed, 13 Mar 2024 17:44:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: arm: amlogic: add A4 support
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
 <20240312-basic_dt-v1-1-7f11df3a0896@amlogic.com>
 <CAFBinCBiCoOY7wK+8j4kNZwny5LFTX99PLk03gUvqnGxJXgvEg@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCBiCoOY7wK+8j4kNZwny5LFTX99PLk03gUvqnGxJXgvEg@mail.gmail.com>
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: c396e368-05d8-4229-7a4d-08dc434242c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lq5Fpsys+PtNOoc2rXO83qe6f4yMlKpmvbp38V1buyxT7W2uzvhtKWBUPV3NkuMp+t9d4fAzS9xKnty424MajtZKlk3GQ+2jxn/aSqkzy0iySYTYhF12bcJd3og6BGavL0fnW+EKarV+aEySnex8/kJKKbshAFjYXgeY3bsEqIauC7v9OYixtfmEDcLrnhK3Ak5cWOS829P8a9zKCw3Txq/TGKCvSWGCB5z9UncxTjB/5WUsWBd3eUV6Gowl1EBZ5rGOkfoXQ36g2wBNl1kUwhw8MfHrI4T6f3LX+OxjwzlyFWIWO+lzgcoWxIs8vo6VSkTeNwKHRo0j6fyV6kVer/DS3tx9mhW2r1g2RXf8RVEUOKP8KverBnsONRauVKZ3+Ybi69yNtlW0G9HAXgYugDreJvnE4Q0woqRtJIr1sFQ52PK+eKg2i6F/59KDTqBub/zKhUzxVZebnInRgj1OKcZwSj9uTJtZp6vuwvbCCrMzaiSXFGGFHeXN60I4SJXTSt9ORMfstVj7ocCpdg1RT25JxLsUcgYbRfyluvAKymAgyTe9Wt7W5ujS3PeKc4zEytRUrCulsJmtElus6wB/DY7xuDSo/E9hpoAxg9sEFJfdlCtOf4BDlpEXgDVTE677gpqDbrUe90N/o/ZZaGq/+qocoykoIz4Li6BoqOqJV7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDN1SmROVngwSW5zK2tYNFdDRjdTeGkxd1E2YWhqeGdDZUY4TnZOUmlZL0dL?=
 =?utf-8?B?WEFpOHNTMlgzYkxjb2luR2tIS3YxYmkxMGl6TUcvblBiRnBrRVpnK2hjUU1H?=
 =?utf-8?B?akJyQjFwVkZYeW5QZWVvUEkrSnhVeFBZQjJ0aUx0ODBhbTBuRkFnZDVqa1pa?=
 =?utf-8?B?c0NRZStqNndHZ2Jmcm9odG9aTVZHMUlDL2V1Q1NWanV6aU02SU45bG44TjZk?=
 =?utf-8?B?YU52a2FsSjBZSkNQSHdEckU1SmZYWksrclZxVUtHMUxhWWk2eHJRREFRLzhM?=
 =?utf-8?B?Y29jVkIzSlNMN1JJbkE2ZnF4NnN1VlFJVmN3ZHdVZWl0VnF4ZXY5SlliTWc0?=
 =?utf-8?B?U253TjlPLzk2Q2VHWTJPbGh6bTR0U21zT1ZkcjgyV1JycmhNT1hQeWcrMFox?=
 =?utf-8?B?MWdKazZKNDNYS2t2dktXbnVMS1l0UU9zVXdLY09tVks0ZWpCVnc4dDYrSURp?=
 =?utf-8?B?cWlmTkw2N3NDSFhwalp5UTRqKzVyUVZNNDhMUTMrdnRqR3VoNnFsbjYwVEVS?=
 =?utf-8?B?bStnUFlFaCtnQmZHeTZEK2ZKc1grWk5xSDF3Z01XVDhmdUJNTWNhZ0h1YU04?=
 =?utf-8?B?NU0yWktLbjJvT0pEdDJPNE1MdDVvQ0E2K0NvenZxY2hyTUx1cWNpd0lpRXVs?=
 =?utf-8?B?TGtodEpNeVIyODJ5dHhHKzhqQ3UwbUlsRUxYUm9oMm44QVZRNFhxRnh5a2NO?=
 =?utf-8?B?aXJtaDR1R09jdS9aR0lyV2Y2YTgrS3VUZHUzYTVTdE9BN0FMNVhua01oU2lZ?=
 =?utf-8?B?ZHB3VjUvc1pIcjlVdkREU0FyT3lsK0dDVy92Y3o0WXc0VndmV2czeldjTW1y?=
 =?utf-8?B?QWVtZzY4eUkwS0JScHRzdExENHBsV0ZINFBRT2ZKWElsVW1IQ0tsUWJLaHNy?=
 =?utf-8?B?KzRUb1N5RytTMTQyUDRKVWZnZWFmaTZyT1VUK2dHSCtyeHhXSC8ySS9vQWsv?=
 =?utf-8?B?Zm9SVmZyK0hLOG0rRmJUa2FPUWRlTGcxOWNlZGlXcERjR3BqSVdyWlN3Z1ZL?=
 =?utf-8?B?MEhmZzB2LzF1dVVXcllCSmd2NEIxK1lsQTdGU1pPeVlBM3BTVElDS0RxVnBm?=
 =?utf-8?B?aDdtSlBRZkRyYnlvYURjMnljdTVrRkdrYkEvaVo3Ti9MaHpEdVlONDZNb3NH?=
 =?utf-8?B?bjk2ME1Hc3JuTlpmWUVQQkFxaVBGN2ZGN0k3blpkTVhtN3lmWkg4ZW0zcFhH?=
 =?utf-8?B?dnMrN282c2tKTEI0OGpCSDVzR2wrK1B1OWtCS09vdVdkU09ieG5URE0vZmFN?=
 =?utf-8?B?c0wzYUMrUXpMSnpaYXNuYjNyUlM1YWVwN1NsbitiWVNpRXNLd3FFSEFHSEtE?=
 =?utf-8?B?aHMySjBTNjZvQnpnSW54V2JJQVV4TUF2OS9tRkIzY01VUkFiRTdIcWM4MDdm?=
 =?utf-8?B?dW5Jc2Y3TnBuOWYxdVUrb3NVOVJ0V2hlUlFmQ2NkVVVQdzY3clBka0cvcTR0?=
 =?utf-8?B?RFFKR2dvcWpSclJLRTJocDhqNVozbHdyMHlkKys3Y1BHc091ekdRYnl4ckRl?=
 =?utf-8?B?RVdHUTh5MEFlWUFuZGlSN0VzYmdrTDNhM0pNajAzNXNEV01pdnB2MzNlOWM3?=
 =?utf-8?B?em00dTh2Y2xIeHRGQitieDhKUGhMTDNVZE5wazlMM1ZzanZGYllIUGJYbEVw?=
 =?utf-8?B?TUFPWStPOHMvYkRJd0pXd08rVDBDSmt0OXpPU2VmMjVmSExWRFMvTUE5TEZ5?=
 =?utf-8?B?NGgxazlCdnRxSE1GOThvTTY5VnhNT2pJeS9TeUVWbGZFeUxRbmhFTWUrYnBC?=
 =?utf-8?B?b0J1MFJOemVURlZqbnl3STNTS1I4ek1UaG5USklKYVNrWjExRXNHNWJ0MTYx?=
 =?utf-8?B?bkZ6OUZrZXNFakRiUSthemd6c2ZoYVdsUVFKSnBLRnhjdFh0a1FiSUJUUzRY?=
 =?utf-8?B?czBKN1E2QnBDN1hJb3VpQ3VYNnozMEVsdWhOLy9RNElIWHUyTG4zWWwxTHBj?=
 =?utf-8?B?bjRGMS84TXVPMk5CYzdxcytBd0kzNDdkQU9IcE0xVno4c2V4QmJieHJHay9N?=
 =?utf-8?B?VURpbk1NYnp1VWRHcEQvWE1ncHFUbnZiMTJEaVl6dEVXRG16eFNXeDZFVHhD?=
 =?utf-8?B?STZEMGRGR1U0R1BYRGFLc3dHS1UwNWNLV2VROXk3djBBbjI4WDdFS2N4SmF6?=
 =?utf-8?B?aEZpejBpTlh5aFFaRnI0WFlQNFVNcG0zNkFCK2YxT0x1TGJKTk1DMjFRcGNu?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c396e368-05d8-4229-7a4d-08dc434242c8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 09:45:04.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mEO4/PNrIdg2FEB+0/2fZ9BbS5JyvteDsPisLpvVJWlAixGo/vCJsngXuEGUUeUbrhZCJjSXMgm0GyG1u9wI2kwIZq350ug1jdv9y8M5nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_024513_447202_8D9A5CB9 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

SGkgTWFydGluLAogICAgICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjQvMy8xMyAw
MToyMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiAK
PiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCAxMDoxOeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQg
UmVsYXkKPiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gWy4uLl0KPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEJvYXJkcyB3aXRoIHRoZSBBbWxv
Z2ljIEE0IEExMTNMMiBTb0MKPj4gKyAgICAgICAgaXRlbXM6Cj4+ICsgICAgICAgICAgLSBlbnVt
Ogo+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsYmE0MDAKPj4gKyAgICAgICAgICAgICAgLSBh
bWxvZ2ljLGJhNDAxCj4+ICsgICAgICAgICAgICAgIC0gYW1sb2dpYyxiYTQwOQo+IFdpdGhpbiB0
aGlzIHNlcmllcyB5b3UgYXJlIG9ubHkgc2VuZGluZyBhIC5kdHMgd2l0aCAiYW1sb2dpYyxiYTQw
MCIKPiBXaGF0IGFib3V0IHRoZSBvdGhlciB0d28gY29tcGF0aWJsZSBzdHJpbmdzPwpJIHdpbGwg
ZGVsZXRlIG90aGVyIHR3byBjb21wYXRpYmxlIHN0cmluZ3MuICBJIHJlLWFkZCB0aGVtIHdoZW4g
SSBzdWJtaXQgCkJBNDAxIGFuZCBCQTQwOSBkZXZpY2UgdHJlZXMuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
