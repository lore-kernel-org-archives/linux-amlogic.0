Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810DFC67861
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2024 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YL4FKo0LJ4AJ8fgLyG311EUZq2UnL+OEZ3FFjAcxlv8=; b=rBir7+eEmDatsC
	TEC6oociwZQ5eBSs8Zk0NqDo5Q/blGfQNThu98ug1AcXrHTtVNqmaYEg6nMVuJyO2xDu4slxt5DFR
	WCdr0ErwQXfY5dUrEotYGSzgJNb99Dkr3hf2p2AvJC64cWudrDUMSz5h6W5RzxzS2+Qab4POUezk7
	8X4UQ8Iu7+V828vsvPZHk3aVj9noHGcRn1ecXu0RbKBbEKN9SlRnBSR9Od5R1rC2hPsBvx1hIBi5R
	PTxIZHl7wypA0Mwuzhky+pWqt3VoCgEbXhyAuzIhIRMUHWUmhdjlTs70ml4Li5Mx7ZaGaKF5o5t9g
	r/KK2bS9++lmnDWg5Fgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6pG-00000000xKg-3Y0V;
	Tue, 09 Apr 2024 08:27:30 +0000
Received: from mail-sgaapc01on20702.outbound.protection.outlook.com ([2a01:111:f400:feab::702] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6p3-00000000xCM-1j3w
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Apr 2024 08:27:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/9i/GfcCCJvvZUgX988smsZ+qDBj0DjqOcov7eNu5j6yZanN74JNkTWspA6+sMMWPDFmjoghuklIizCto4pCGr3AdfFrIRdgqetEsMVBRR9PiPiIUjXrGHLojmLWyzdQ3porbTC8nGsMNF44x2VG6kjCAK6rvlxrFzcHbIIa97dwIEEgOlf8/Vpb6K6J2VFkWNEktIGQcBB7PsouGex0zVTrLLfSSgjNf2kASu0snxSHnOuu00YvJ407SvnBaWSM59rCDlwalZhuvXHeC9R5X0KAKVsPskyBePqsI4fbeozauoU5pCs8gxxCshMVO37R41Yu4gO9wevuUmmmriuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH0GRc/H/DLf7+uJGT/IyjQljXh2DM8YRGEjSfdu8JE=;
 b=kUKmt79BRMtIECebP/5L4r+pfSxwMFDWIZ6fFBdN1HGvxHVuNaFSr4g1Eh/fjeKfqkMIRHpcJ0B2anmgWQrSO6kodi/bPGZCnLY6vAW2ZHWzOtnQgMFnAPugAvsVk3DXjWtPxnlMowxmfxsV24a4QbvI+JtDVeF83nN/zv2iTAWMTiwJmbO79ORd1bY5+A/ZJiOlqAlIkwUK4T2RqXG93V87/Jl0l3Sxfw9EwzOlpdXAyDy2t+Ov5CaiJP5LQcKOrkkV26unV8QMuIUszhnnzw+By7C4MGiJIxLGCoCwCeSFFz8tN6wR3QVZmNZuezYOH5d5+159/tM55cTli26Qcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com (2603:1096:400:26a::14)
 by SEYPR03MB6880.apcprd03.prod.outlook.com (2603:1096:101:b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 08:26:55 +0000
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::c4f9:d4f1:c115:f1ca]) by TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::c4f9:d4f1:c115:f1ca%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 08:26:55 +0000
From: Jacobe Zang <jacobe.zang@wesion.com>
To: neil.armstrong@linaro.org,
	narmstrong@baylibre.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: quic_jesszhan@quicinc.com,
	sam@ravnborg.org,
	nick@khadas.com,
	thierry.reding@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Jacobe Zang <jacobe.zang@wesion.com>
Subject: [PATCH 1/2] dt-bindings: panel-simple-dsi: add New Khadas TS050 panel bindings
Date: Tue,  9 Apr 2024 16:26:41 +0800
Message-Id: <20240409082641.359627-1-jacobe.zang@wesion.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:2::34) To TYZPR03MB7001.apcprd03.prod.outlook.com
 (2603:1096:400:26a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7001:EE_|SEYPR03MB6880:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mcQi3yi8vMqi+7nEg17bEc4eS5kWeUBbMD6syID1CteEiBVKh/guq9EI5oUVQbP9gLkC0kYdV+N8wlgUkz/93RFhs6zOyBGer+f87lLniMl3Y4vXYDePTC3AgrJU7q2JJF0pbGlcuX46P62T0vJxS9iqze8UOEmB+RTGjfvohF8HF1nZBB5SrOQEc70WdeczLSBeWmvEGVfD+p6SXDPEvUVaM2iInQWDfQc9IgeCINovkTosWup8QShiCyF3UEXfzvFcVQBhky5eojk96eA/D4EA8/4OGYojgckaHMI802XHpN8OKM0QIpf0/7Zby4dqxu39aLO8IaNdLGoXsmGii2vxsgVKdFiGEda+LGAtcYNgC1b2RBlRqg9YsnEnEr2d9O2lM3IAmnsgtFh9qglHApJFTrxA97mrSlr/zetj725MiJWlrrnqhITo6KSjxEJ2KzZtutifke6YiB22A+ZrdgKSVqrBfAq4NxH0u7837CYRCqDVcrqq1ZN45aaGpWcs7G8a5VE0XMQMk0oteWqbSL6hXyoKamAWyBYFLUT9dCUa2ZdvIk7gXcGZXMb9Kq3sb/mGZ7YAVq3dIboMHA7v2LiFa/o+fbO4MxO1/dv4VD0+rn+oNaVbINrtYKTDI4ut9fmFY5hbPuxP5Ro+cDWb0XHFaCrLyiKXptbwnCz3dhjXUUX1hnx3NDC/Qx1bnyEroBSnlUFwP6dXjfjnxZPAGOHD67VX3+YXh8VqFSNRV7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7001.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(366007)(1800799015)(7416005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdRTXdCbm1BaUJ2SmZrbHFpN3E3VFpnMmFscE9mQ0doeGN2NTF0d1NQSHJI?=
 =?utf-8?B?eW81b1hVQmJNYW9KSHVCSUpNUWlPdXZVa0lUSlVMS0ordmU5TU1MZEk2T21l?=
 =?utf-8?B?b2UrSjFkSTBRZ0FZM1AwSDZyNFBWY3gxWXRDQVU0ejdGVnFrSlZMMndxVEFs?=
 =?utf-8?B?MXhVOVFqSmxjRmRZekw3K2RuMStLMkk2SGovd093NWppWEVyRS80SklnSWFn?=
 =?utf-8?B?ZWphb0dXc1JRZC9MUGFIYjRPRUFvMnhjdW55RVVsOTJiOEsveXVFb3pDVmw5?=
 =?utf-8?B?SjJVM2JObkpaeDNWeHIzRVloRUJvbFJYR0ZhSFpIWTg2dXRob04rYlY4M1Q1?=
 =?utf-8?B?eitiNFBuaWpKQ285YWpFRUZpUndnSmlCMTgxZ2MyZmdCNTlrT1hIN3N4UjZW?=
 =?utf-8?B?bU8rV2JXa2FMRzRsTDllRDNpM0MvbjFCWUdJVTIxNWlzeE5TSTdic2NnVzhx?=
 =?utf-8?B?QnJDQUxGdTl3c0liY0xZQzMwNlJxMFU2dk5IZGRjWUpsQkpjbVliTnRZZmRJ?=
 =?utf-8?B?V1FxL1BjeTJQTzgxS1JMSGovbjJjVFZxdnJFT0dDK0NsYlA4K3lmSkFUalpE?=
 =?utf-8?B?bWdOdHNOMTI0VGwvaWhDTGpDMlFGaHJuTGE0Z3BTeTlIR1M2SDRvaktJRFV6?=
 =?utf-8?B?MGFDcklyQ1J0UDdVbmVzMnk2MmI5eXZFYjZMOTFmYmY4MnRTWmYvYUl1ZjAr?=
 =?utf-8?B?THhaOTRtaVdDTWt0UEliRmQxazEyek1BbnVqY2JNaWlVK0VKS01RbjdRVWpo?=
 =?utf-8?B?OEtIM25vd3orRGd1TDNGS0paLzlGb0JyT2xEQzg5aEwrVmFrNWFDUlBDNXBN?=
 =?utf-8?B?ZnZVV1V1U0Q1ZERtM0FtVUpBMDM1b1FrT0I4dnVpVDBVM29pcU01eXlSaTkr?=
 =?utf-8?B?Ukttc0ZZMGozdkh0RUZtOHhqNU5MT1p5T2hiNTRHcjJsZ2FaMUI0M3BuNXhp?=
 =?utf-8?B?NGlxOXdOUHVGQ01LRy9PQ2g5SmlpUEhzWU9FaExLVHZ3cThDQUEvYnZVOWY5?=
 =?utf-8?B?K1RNZmgzaHluSzJ0bVROTjA5YVV6TjFSQ2RrR3Y0THpGZGFtM1p0RE5SNUt3?=
 =?utf-8?B?ZFhIdHFObG1aKzBJc0ovVmoxRVlxT0diZmY3NnRKN0V3cUFVcVh0N2I0aDc4?=
 =?utf-8?B?djNXcmpwRUQ0MXJObmZxcVZydHJ0K295dHp2eWI3dEZYOEthSm5MMmtSSWFN?=
 =?utf-8?B?ZUFjRTVQTDlJeHlTTmhxVVZpS0hGblBJRUliUUtWOU1IOWlSRHp5K2xFa2t1?=
 =?utf-8?B?SWNTZ2xpNlpvSG9TVGVGYlFZVEJXM04zYVA5azgzc0NkS1FwbDc2WmJoalh1?=
 =?utf-8?B?RXcvZW5YWjROSXFramdyTkJvQUF3L0gyTldMZjVoZGJXK1hqeFlsd2tkVENq?=
 =?utf-8?B?TVgwTWZUeFZXejlqZEVoWWNFVU9DUDdieUpwTGcxSUo3eVpraUdrTW1HZ1Ju?=
 =?utf-8?B?cjkwY2xMQ3E1UWhmNmpQNnJXWDYvaTlGTlgra2Y1Nkh4cWFoOExISDM5Z3pQ?=
 =?utf-8?B?NGY0cHJTazZzS3VrVkVuZVo3S0o0OWt3RGlkR29UNTlpQUhFakx2SFpyb3Ew?=
 =?utf-8?B?U25YTDZqbm9XYlFTSEZ0S0ZGbDNEekxQQnhOckdtT1hlaEQ2QjNtS3ZsNXk0?=
 =?utf-8?B?TElnWXRhV001MWNFaks4VTFTUmV2RnN3SFpUZXh5Q2dJWDdNSGEvYm5ocUR4?=
 =?utf-8?B?SkV1S2gzSG0yYTA1MUs5ZWxIdnB2ekVNRTRoemRTTDhjR0tmQXBYNldwSXk2?=
 =?utf-8?B?MEU2aG10U2NtNmVUZXBtSzlReEZIdEVMMjFHT0hhN1RzcGg1L1Bsckd0Kzhv?=
 =?utf-8?B?UVpzc1hrYktWS1luZllqbllYUFc4NmRVeWN4ZTNSWXhlcVFhWXFmTDZsc2dD?=
 =?utf-8?B?aTAvL1VwT3V6UnZzS0tETG9XUHBSY1RYZUh5TXNtVyt6WStxRSttUGdaQzB1?=
 =?utf-8?B?THV0M0UvdStTS0UrZnk2OGV5NForcDdQalNWaWJEb0RiVGlpOEQxV0ZiNWhF?=
 =?utf-8?B?VkIraUhBVlpFd1dBMEJqKzZZSFRuTmIva0dldWpwc01sTVV6dGh5c1dyZTZo?=
 =?utf-8?B?TWg1YjE1Q1RBakxnVVF6eGNlYmFOZ0pETkhYNGgwRnNKMUwwTHg4VDVDRkNx?=
 =?utf-8?Q?BhNErla7Wlvf1o+V2CP5tB717?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209dcff2-5c3e-4c6f-90f2-08dc586ed0c7
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7001.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 08:26:55.4281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcdiWu3UIL9+jzFpAp8bgnRNXmMimvMEEwVM7ATNNCoxN5/9WqEB1E0GIxpSeZwD6+BU78tOUwAPf2vgsOfTOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_012717_727480_EE6F4B53 
X-CRM114-Status: UNSURE (   6.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhpcyBhZGQgdGhlIGJpbmRpbmdzIGZvciB0aGUgTmV3IEtoYWRhcyBUUzA1MCAxMDgweDE5MjAg
NSIgTENEIERTSSBwYW5lbApkZXNpZ25lZCB0byB3b3JrIHdpdGggdGhlIEtoYWRhcyBWSU0zIGFu
ZCBWSU0zTCBTaW5nbGUgQm9hcmQgQ29tcHV0ZXJzLgoKU2lnbmVkLW9mZi1ieTogSmFjb2JlIFph
bmcgPGphY29iZS56YW5nQHdlc2lvbi5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUtZHNpLnlhbWwgICAgIHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1kc2kueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS1k
c2kueWFtbAppbmRleCBmOTE2MGQ3YmFjM2NhLi5lMTk0MzA5ZjMxYjcyIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1w
bGUtZHNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcGFuZWwtc2ltcGxlLWRzaS55YW1sCkBAIC0zNiw2ICszNiw4IEBAIHByb3BlcnRp
ZXM6CiAgICAgICAtIGpkaSxmaGQtcjYzNDUyCiAgICAgICAgICMgS2hhZGFzIFRTMDUwIDUiIDEw
ODB4MTkyMCBMQ0QgcGFuZWwKICAgICAgIC0ga2hhZGFzLHRzMDUwCisgICAgICAgICMgS2hhZGFz
IE5FVyBUUzA1MCA1IiAxMDgweDE5MjAgTENEIHBhbmVsCisgICAgICAtIGtoYWRhcyxuZXd0czA1
MAogICAgICAgICAjIEtpbmdkaXNwbGF5IEtEMDk3RDA0IDkuNyIgMTUzNngyMDQ4IFRGVCBMQ0Qg
cGFuZWwKICAgICAgIC0ga2luZ2Rpc3BsYXksa2QwOTdkMDQKICAgICAgICAgIyBMRyBBQ1g0NjdB
S00tNyA0Ljk1IiAxMDgww5cxOTIwIExDRCBQYW5lbAotLSAKMi4zNC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
