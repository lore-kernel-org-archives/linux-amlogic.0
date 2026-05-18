Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16EACD4F3D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 02:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvpabG0tHDSuBGip6EoBc6VPkthUiurGimXNR9zgnR0=; b=RHVJARYQmWBBl+igWzwQ9vdCY1
	MrIJrSlw9w/O3xzPYkv9WlyxuQzplPuNHzbq1wcBt3DM7GHbRGEoZs6DWO3G0MdUo37FRW2//dkAq
	5nSzbCFDZxi12rUc4yvKiNzBKZCQ/uplVgCz0uK83lt5h3NAL4IovupI2oZ1azPZEg7j9xVrvQwgx
	xI9+v2O6y1xV3QLz6mPR2y+ANSaXa4DCx6sdCdZqTOkN8ap8ZbPLdsNFO9tztyRN07a5CZpUv4uqk
	qmBAUqkWc35aWDF1Lg2uncvpX7pVMNHzCaMNz56M0rKwMfH4+HIvCo62ibNaNJ3UKJrIA3uzmBC3M
	xMoBVb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOo7y-0000000Dz36-1KQI;
	Mon, 18 May 2026 02:54:46 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOo7v-0000000Dz2C-1Kfo;
	Mon, 18 May 2026 02:54:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiIcVhnhdkFWINmWUgM3j6FIUawBoBzWXs6cgkxTdSsYmMtpXOY/8q78kVTmExQuSSe1JFFo5Tk/dW8UMKk4cpBm1ktWRe/ZQH287T2Wc54YmPiAF76dIa8K7tw+PuOgYQ0Yti/VQjBj1aCsT+KisEBEggmoVOiGX9uiPQ9m9P+3OnKqpJdI2zUStaXEyF6BxWahsBcXbBRml3V5k9U97zk39krih/k76cmpz/xNJGL/UF3g/PXHy/ujo5n+rrFASfZp2wE5AwR2EIKDFNPOloshJHlBAZoPdHtLOk+WW8CmA56Oinhrdzc8zy2yjBBAo6UQ2SftMZ5cn7eX1rlU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSGaZm4Tq2uCXDKeeZWZG9xlQuzya7ogrnCfCnJNTEA=;
 b=TLr396FioqlNWEzzvSzAePBfegMwRL99WsZa9NhwUHO3Smj55WZauxjJMMxWwOH2x7Vhx9wFFHa372EmoIFfb0lE5QR5PV4EcexvAzOq7kSJkZO058gv09uH1mu8TKhG4+/Pudw3Vv0eFxzDWrD26fnXQ112gPp6sQs06v04O7qk7pwmMYpTTTOT36ReeKfo+ZlyiPQ2ZLoVG9cbA29UBFSIqibES3e+xYgU6raDYbO3rh1EfHjvJZ7rARJWll/NEFg9M8e8F7cNfHINsHpNlLxv7avz5MY19DSAVRNMPmFmXLgC52K7KobcpYjGhCS/HyOzqaOHOSrw2lzDxUtNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSGaZm4Tq2uCXDKeeZWZG9xlQuzya7ogrnCfCnJNTEA=;
 b=Msj9TO4gCOUOsTKZcNwa7HXQf2A0yKnFmfFCC6oeEg2QWDZv5kv79wLZgfAl+XFYhouUdejXNtK6FUIDU6kly4PhftgziRv1/EmK7n3xfIpatWXBFBIGeHwxCWkXsECAWXZvzFobkksOj185nVXy6mMO7R4xr/H2VycxxfEtD/et3xYDf+2xXnPVNyM/hwAeyq45O0tYKJxD8ySp4O3H9kTREV0RUMSNZXDK5gmCKT22A5GGEzG9+iAK+yrv3ZcEj4LZxOqvRdYKSy6EyVKAcroDFmTowRFsq8zYUoIKbze1761m6pIDmgEwmrojvhQhuGg853cT6wrpNwsVyV1S8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE1PPF608CA1C66.apcprd03.prod.outlook.com (2603:1096:108:1::852) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.16; Mon, 18 May
 2026 02:54:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0048.010; Mon, 18 May 2026
 02:54:32 +0000
Message-ID: <20ce87e8-eaf5-4e64-bb48-c56f33001c47@amlogic.com>
Date: Mon, 18 May 2026 10:54:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pwm: meson: Add support for Amlogic S7
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com>
 <20260402-s6-s7-pwm-v2-2-657dce040956@amlogic.com>
 <agn2Yp3mzI7DcsyN@monoceros>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <agn2Yp3mzI7DcsyN@monoceros>
X-ClientProxiedBy: TP0P295CA0059.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE1PPF608CA1C66:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d82ac1e-2d58-41ce-2840-08deb488c97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|22082099003|18002099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info: H0lYnRyjA9aUOpu8+yqIWqFOKe6XaXMudOLy2Tke7eNmORa17Jf3ftYByPw4UXiNMA5rnJotKZEWY9MPiGC9zMddOIe2eUS5V3xHnIF+FIIe02y0r7Sr/PT6UbWVHJAPp8v13DEDlu5qZd2lt9BJzdbp1/BG2fRqL8Q+Xa9kB4eI0KvrxkveGfGlJlUxjw40wnqz0oBkIuQv0gdXG52OpNYL/oB8N+yYJNrSrKQtMzZ/P598QpVTSbVvi6lLdJjSkjMaIXus/dTsMHhVEpydOUnlu8jQT2GNUTzDFyvLCN6FSoMZnmRpsxwoiZ/9xT9bhL/jVN9DyR/wStcVgF+TBdqQ2BFDsTUrbNBeKym4l60i1Xyc8RCkOa8gZWuvpkQgnnG1yedleCYdeI5Mhp8VLVSj11KrA+bWlyhu6sb/DGBN9kBBzQVn8k+7L2yZwqwo0BraICZKcKdPlaRjrJZq867RfCbO5R9NLFABj5gtevqOD/LFS598sOxiESSQIByqy5S8c+FXRp+M8u0e9kSVX/20fL6nb1Pd8LD7tFm9WC6rJQq87mBpx1UVEynZUYgE1YYhh2B2Vz30azPMz/8iDrYQLul8yKLo03iJUpMrFucFI+wzTDi4Ginh1AAA7ghW2IHjdm9kDUOwUcToaUH/Zp6XeQBL72/Cacezc6kdH4X3bkoORKARHGENLhIHfewq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2lrb0dJeDY5VzlMMkFzYWoyR0o0b1pjZE5PYlg2VVhPZWxDdklwamxpL2hS?=
 =?utf-8?B?VDFBOHNlc2tMb1FFVEJMOVJzU3FjRmRyQlJZLzJrT3VNcXF3NmtqR3F1bklp?=
 =?utf-8?B?K0ttY0t5clh4Rk5tRFlYVTNPOGZBWHNackhGM09zQWZyUm9GWExnaXEvQTRL?=
 =?utf-8?B?M2lzRW1GbUVIKy9aT2lhaHp2VzU3T3E5UnFvWHRXeTZZRDFHUURYWEN2bzlK?=
 =?utf-8?B?TXlvUER4b0Z2UzRTZUhlVHVmUHNLSnZCR1ZUa1Y1eWtzejYyd21aN3RCRjdi?=
 =?utf-8?B?Z1VBbSt3QnpxK2ltWG5YQU9oZ3NwMVFWdy85andHaS9nSzYwRENwMGZpNDBF?=
 =?utf-8?B?OVR4N01qNTdrQm1WYmF4M0JGelBSRE4rR2JranJnZWgxdU9zdXd4WHlLc0Y1?=
 =?utf-8?B?TStKdzVLbGszN0RaT29MTjE4b0l3OW40VU1URHh6bmVTekpqcXJQcUVVMG41?=
 =?utf-8?B?NmUrOTBWamtMNTdRQ21oWUI2TVVNdjlMNkIvL1dkaXp2M3Z4QmtjeDM5MTQ4?=
 =?utf-8?B?NVpuSnpTci82d3lvUDZDZENoWlozNGY4Q2cvcENFVURnUWROTHdUZlRhaWh4?=
 =?utf-8?B?YmxHYzlOem4zdllxSzdQMWg0NW9EMzFaaTdVYkE2VnRCTjZNdDZNWjUwWWZ6?=
 =?utf-8?B?SDE2VFFIZXh2YlFLYTk4bUJnUWRpK3JMV29yRC8zSVVVSUxCaHNKblBPWHhl?=
 =?utf-8?B?TFErTWRFNmVYY2VPcVk5SnZCVmdqdUFCNEp3YXJlbEl3aXp3WmZjYmZvOWZG?=
 =?utf-8?B?SnBHWExKS2xCVG05SUx4TkcvL2MrTDBsOVFDSVl1TDUzRml6ZVRya0RIQ3BQ?=
 =?utf-8?B?eUUxTG0zSytBeWpHakNLSENmRExYRXNENENxNjBGMHUwa25tWTBHSEVXUE4y?=
 =?utf-8?B?ejZveHlmeGswdUdBVWVpQzNlT1NoUDhWVjF5RFpETWN3dFpnZVU1NFZRWVh5?=
 =?utf-8?B?TmZmSS85RWZHUFFoYVNmM2NrT1RNanpGZHliTk0rRjN0YjhVT2craDVFZGVI?=
 =?utf-8?B?VHVpYWJ5T29JTTRkWHI2aXNBbE4xZFpwYmdNWm9RYVB6cE9zL29pYjE3YnFV?=
 =?utf-8?B?WmNqZThTNFJuNlQ0dWF5RHdRUHl4SWJwaVhHTXNLdnpRcUV2NVlUYUZlT3Rr?=
 =?utf-8?B?S0tabTBlV2FMVFMvZ3Qya2s5L2FPRU9yK2ZlSnM0ZEJvVmdETjNuYWgyWmxa?=
 =?utf-8?B?eWZZUVZlaTN4cjhtQWNFZHB0RHZocG1VTTM1WWRNNUczMjVXQmM1eDNhL3gy?=
 =?utf-8?B?b1JMOEdLTTFqY08vWGhaQ2RMT0U5U295OFpDYWdldnYxVDVCZjNxSGRUVXBP?=
 =?utf-8?B?aUZrR25YeVNDQkFUSHBVQWM3UmlhU3Z4TE9zSWUvV1V3SFk5RjJZend2K2hJ?=
 =?utf-8?B?V3ZIZnB0TE5ZN2ZDZldIVExyNXJBcnR1Q29qOTBEeDlIVzJYSGhaTVY4QTBW?=
 =?utf-8?B?aTFGenQ5MVhHNit4SE1oejM4UEZCbGhTbEh2Zi9qQmxMOEVhS09PT1A5bGpK?=
 =?utf-8?B?OGpKZkNISXYyOXlyMFZFRjBoY0s2YXArQ245TWxYS1g2MUt5OHk5VnN5UFFt?=
 =?utf-8?B?TG9WeU1BMklJeG5FWWVQZWREZThRL2ZqTUVYaGJZK0dHc2VGczlEOFNTWVVZ?=
 =?utf-8?B?MzhQSU9peW83Tnh2Ykl4YUJzQnBNQVNVQjZUOEpZNk15SUp1RWszQ1JTcGtQ?=
 =?utf-8?B?eGtScVVVYytPbTZ6Vmw0cllMMTBoY3dlcExFWHhpeFZuN1ZUVUUyYTc4WGMz?=
 =?utf-8?B?dlNtQzV5WC8xYW9xYXNWNEdsMWxsL3FxOC90UEp6bWkvRGF4cmJvaGFBUXVi?=
 =?utf-8?B?ZFhRU2tES21HajFpS054RER3S1lVQVhZRHhabVhuSVZ1Q3ZlUWNXVFhZSnpC?=
 =?utf-8?B?Y1h6eTBUOWNRQm13VURhcEtPTzBiRXFaYkhSQWIyTXJhOXZUcjFCZUdyOEt0?=
 =?utf-8?B?NTd6Y2poZmVHN2lHSWpOMVZaVUx2YkYrWFBUdklXM2lZWE9zNW9pd1ZWUnFQ?=
 =?utf-8?B?N092dEc3YytoanhlMjdsWmNwUW8rYWgyS3NOSkpzeVh6MmU0em10RUV6U3NB?=
 =?utf-8?B?RFowQkw4MzdOM3BMK0JVTHlBdFdES3g2dFZ1KzJldUJ3azU4YllpQlFhVFdE?=
 =?utf-8?B?dkZGbVAvK0twZTBLajlnd2NnVDBwdmxiR2FEczErSnZPclJSQ2t3ZnM4TDRk?=
 =?utf-8?B?SHdkM09sWFpmbVozc0ZPQ01xVGtDa1M4dVVaV1FOMjduQnBMWTI2VFNnSmhC?=
 =?utf-8?B?K2VHU2tiSDNUMlV6QjRiVXFyZ01VcGVzVU5SM1AyUld5RVZZT0NzcFVkYnRS?=
 =?utf-8?B?bkxWS3p2eEh3TG4ycTFLS2F0Yk8ya0g2ejJQOE44eWNYU0xpcnE3Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d82ac1e-2d58-41ce-2840-08deb488c97e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 02:54:32.3475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqqogjTyRKuaTrPW6OgDZ0PZVNAtcAGk3MlcAm0JMuwiRVVE7KUc0K3SMAjtj94fLjflRRKh2GKhXnmpT/3Gy+0zPyShpZJR8eryRruDOPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF608CA1C66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_195443_375724_913B4786 
X-CRM114-Status: GOOD (  21.19  )
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

SGkgVXdlLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjYvNS8xOCAwMToxMiwg
VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gT24gVGh1LCBBcHIgMDIsIDIw
MjYgYXQgMDI6NDA6MTZBTSArMDAwMCwgWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheSB3cm90ZToK
Pj4gRnJvbTogWGlhbndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4KPj4gQWRk
IHN1cHBvcnQgZm9yIEFtbG9naWMgUzcgUFdNLiBBbWxvZ2ljIFM3IGRpZmZlcmVudCBmcm9tIHRo
ZQo+PiBwcmV2aW91cyBTb0NzLCBhIGNvbnRyb2xsZXIgaW5jbHVkZXMgb25lIHB3bSwgYXQgdGhl
IHNhbWUgdGltZSwKPj4gdGhlIGNvbnRyb2xsZXIgaGFzIG9ubHkgb25lIGlucHV0IGNsb2NrIHNv
dXJjZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxv
Z2ljLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9wd20vcHdtLW1lc29uLmMgfCAzMiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdt
LW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+PiBpbmRleCA4YzZiZjNkNDk3NTMu
LjdhNDNjNDJlZjNkNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPj4g
KysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPj4gQEAgLTExMyw2ICsxMTMsNyBAQCBzdHJ1
Y3QgbWVzb25fcHdtX2RhdGEgewo+PiAgIAlpbnQgKCpjaGFubmVsc19pbml0KShzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXApOwo+PiAgIAlib29sIGhhc19jb25zdGFudDsKPj4gICAJYm9vbCBoYXNfcG9s
YXJpdHk7Cj4+ICsJYm9vbCBzaW5nbGVfcHdtOwo+IENvbmNlcHR1YWxseSBJJ2QgcHJlZmVyIGEg
YG5wd21gIGZpZWxkIGhlcmUuIFRoYXQgZG9lc24ndCB0YWtlIG1vcmUKPiBzcGFjZSBpbiBtZW1v
cnkgYW5kIHNpbXBsaWZpZXMgdGhlIGxvZ2ljIGEgYml0LiAoQXQgdGhlIGNvc3Qgb2YgaGF2aW5n
Cj4gdG8gYWRhcHQgYWxsIGFscmVhZHkgZXhpc3RpbmcgbWVzb25fcHdtX2RhdGEgaW5zdGFuY2Vz
LCBidXQgdGhhdCdzIGZpbmUKPiBpbiBteSBib29rLikKPiAKCkkgd2lsbCB1c2UgbnB3bSh1OCkg
aW5zdGVhZCBvZiBzaW5nbGVfcHdtLgoKPj4gICB9Owo+PiAgIAo+PiAgIHN0cnVjdCBtZXNvbl9w
d20gewo+PiBAQCAtNTAzLDYgKzUwNCwxOCBAQCBzdGF0aWMgdm9pZCBtZXNvbl9wd21fczRfcHV0
X2Nsayh2b2lkICpkYXRhKQo+PiAgIAljbGtfcHV0KGNsayk7Cj4+ICAgfQo+PiAgIAo+PiArc3Rh
dGljIGludCBtZXNvbl9wd21faW5pdF9jaGFubmVsc19zNyhzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAp
Cj4+ICt7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gcHdtY2hpcF9wYXJlbnQoY2hpcCk7Cj4+
ICsJc3RydWN0IG1lc29uX3B3bSAqbWVzb24gPSB0b19tZXNvbl9wd20oY2hpcCk7Cj4+ICsKPj4g
KwltZXNvbi0+Y2hhbm5lbHNbMF0uY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVMTCk7Cj4+ICsJ
aWYgKElTX0VSUihtZXNvbi0+Y2hhbm5lbHNbMF0uY2xrKSkKPj4gKwkJcmV0dXJuIGRldl9lcnJf
cHJvYmUoZGV2LCBQVFJfRVJSKG1lc29uLT5jaGFubmVsc1swXS5jbGspLAo+PiArCQkJCSAgICAg
IkZhaWxlZCB0byBnZXQgY2xrXG4iKTsKPj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiAgIHN0
YXRpYyBpbnQgbWVzb25fcHdtX2luaXRfY2hhbm5lbHNfczQoc3RydWN0IHB3bV9jaGlwICpjaGlw
KQo+PiAgIHsKPj4gICAJc3RydWN0IGRldmljZSAqZGV2ID0gcHdtY2hpcF9wYXJlbnQoY2hpcCk7
Cj4+IEBAIC01OTIsNiArNjA1LDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fcHdtX2Rh
dGEgcHdtX3M0X2RhdGEgPSB7Cj4+ICAgCS5oYXNfcG9sYXJpdHkgPSB0cnVlLAo+PiAgIH07Cj4+
ICAgCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX3B3bV9kYXRhIHB3bV9zN19kYXRhID0g
ewo+PiArCS5jaGFubmVsc19pbml0ID0gbWVzb25fcHdtX2luaXRfY2hhbm5lbHNfczcsCj4+ICsJ
Lmhhc19jb25zdGFudCA9IHRydWUsCj4+ICsJLmhhc19wb2xhcml0eSA9IHRydWUsCj4+ICsJLnNp
bmdsZV9wd20gPSB0cnVlLAo+PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIG1lc29uX3B3bV9tYXRjaGVzW10gPSB7Cj4+ICAgCXsKPj4gICAJCS5jb21wYXRp
YmxlID0gImFtbG9naWMsbWVzb244LXB3bS12MiIsCj4+IEBAIC02NDIsNiArNjYyLDEwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1lc29uX3B3bV9tYXRjaGVzW10gPSB7Cj4+
ICAgCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXB3bSIsCj4+ICAgCQkuZGF0YSA9
ICZwd21fczRfZGF0YQo+PiAgIAl9LAo+PiArCXsKPj4gKwkJLmNvbXBhdGlibGUgPSAiYW1sb2dp
YyxzNy1wd20iLAo+PiArCQkuZGF0YSA9ICZwd21fczdfZGF0YQo+PiArCX0sCj4+ICAgCXt9LAo+
IElmIHlvdSB0b3VjaCB0aGF0IGFycmF5IGluIHRoZSBuZXh0IHJldmlzaW9uLCBwbGVhc2UgbWFr
ZSB0aGlzIGxpbmU6Cj4gCj4gCXsgfQo+IAo+IChJLmUuIGFkZCBhIHNwYWNlIGFuZCBkcm9wIHRo
ZSBjb21tYS4pCj4KCldpbGwgZG8uCgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
