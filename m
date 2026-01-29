Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB1D73E84
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jan 2026 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y37lcIZANLJi27N+zicPDgYLfJmpxz0UC52NJwM+NUg=; b=ljmgmcWqY33e+H
	mcOazAqel3w+uSHIx6e3+oStW1yei1Ddbh5NASZP5YM8/W76HNIdN4D4uP88Zql6+1r8AbWUIy2+f
	Yc8hj2asG0Ax2/9dNTrgvKiS11M+6j25IQ5GDATipamnHFBT2Fv/JlzZZx/boA4PkDjpSD0VQqVho
	YZsc4MspMsSOvQMUSfpfHgcyTBx5GAZyKOufugjpRLrbWNDBzUzq6aZVL7n8OLJlLxu2ByMtHPXI2
	exwombXJuNa+sbaGhd/g09dp4t2ewK1THdJXxNgdqGbam/US0D+jvtIKYfQ83S/zZpaNQgLOCiR3I
	zen9P6PKpixNnL6GFmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWEY-00000000TgO-3xL6;
	Thu, 29 Jan 2026 17:55:10 +0000
Received: from mail-francecentralazon11013025.outbound.protection.outlook.com ([40.107.162.25] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWEV-00000000Tg2-3Q0p
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Jan 2026 17:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUFLWc4qsCgEFz+SkUnl6DvXFGBICst8oEYxI/26j2hPuHEgTQGTdqi2fpqO/+gJTobdCe+kmTNZDLEs9eZLZVwvtXfbmRjMjwLiTRyUhh8GLyoAUOROmjSBxCoKrlLMgcYArNteQCnNPhtBZX8yTVXUjbHro6dbZNZGdUyTUqKzCcK7eBlllwNXzPOOIjx+x5XKZJtsFYa3OhsLGwsS7rHLE0DFWim3KnSNzukFHN+nz+NkDXt9Wt18A/HwFtwxWkUpJy3yHFLDNefWhw/sbH1Fmjxa1Lf8CG+7M87OUKNfCcZUZASZRj4Heqa0uqblE7YV4qWCCnO2oQHJzBFFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G942cNwWVMVrESCSeBm/yZuk+L//AdMEFTpkJKbjdsk=;
 b=jQg6kXPwuKZnOROdv+cmx5JhN+YGGsW6mz3gD5GwOYwdGZojveYn9kV+ICT0o4JthT5Qk1JoLBDek9dw4YIjYtFGw+Pqv/09gyuMoWULfynrCykax5Nykt/gF2ZkJ11lT/WYfX+Gs0bkCiKyq1eHdlq261Ju/kEy36a+zvzO2FBUGliFGDJcszEVkUhLX02COxhLIP1DulidI7NlgWA/HO2VZsQxK0DHqFtw5XvOtuPgEsmAyjIDTWXz8M5Bu+YSQtl3Yte/ILE+3uuG5Xtyj5CdSBnMaCfuHYpAX6dqy3XOFfQoFJ3b937WBndUvh7xCrQGBaTYMhDf2WUZYtyIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G942cNwWVMVrESCSeBm/yZuk+L//AdMEFTpkJKbjdsk=;
 b=XjGUp1lGxei+/43LqWlOhR8DApBzStM54+IKTRI6o8morFEhUB1pdh4Jsa0YH0bpJXAgnBuebj40rK2Yp3MrJs6LlBMHjUJ5bjwXYGZQEEA1C573RuKfxgRRxaDAZjTPE8HGpji74zqUbfdToiJ72bMq+vOGHd8mfxzAuxcFm9e6WTVrSMuuTYYI61ANw4ydADCSzyhwF/QpuLOuTZRgEHp94SawEHYRFIsPLolDgsnnzo5NZ/Fr30nUVP+qPlYMwU8n1zdtv4dD9WN5vq1EM5Nzl1QNMVMj+F7xNLKJbOfXdOj+tCcea6uALkoXDArLUBSAFODo3TG/VjZKjRFM/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10777.eurprd04.prod.outlook.com (2603:10a6:150:227::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 17:55:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:55:00 +0000
Date: Thu, 29 Jan 2026 12:54:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Message-ID: <aXue7DTy7mgwxeks@lizhi-Precision-Tower-5810>
References: <20260127-amlogic-dma-v2-0-4525d327d74d@amlogic.com>
 <20260127-amlogic-dma-v2-1-4525d327d74d@amlogic.com>
Content-Disposition: inline
In-Reply-To: <20260127-amlogic-dma-v2-1-4525d327d74d@amlogic.com>
X-ClientProxiedBy: PH8PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10777:EE_
X-MS-Office365-Filtering-Correlation-Id: 15bf7d42-1c0c-435e-155f-08de5f5f8575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzRaajc1OHRoTmZ3dmJZZXpQRkNGbU5JR1JNQW5HdEtNSUFIRG93WUdBck1G?=
 =?utf-8?B?MEY2WDhhWWFycm9QbVgwemtsTjlQVjgxV3B1ZlE5MzM4QjR1ZW81dEVRdThE?=
 =?utf-8?B?ZUw0N2swNHZaTzlaN0FqSk04RlNuYTk0b3Y3TXlQM3hFVGVMRXpxOUFabW4r?=
 =?utf-8?B?QU9pbXU0QWlqaTI4TkxZS1kzU0F4QUdsOVBILy9tZmhIbWlQTmNGUitPMUx3?=
 =?utf-8?B?VnBCbk01c2dqWHlNVnVmNldzYkwrbENoaTNGMHJ5aVhZZXMybEJZYmZ5YUNx?=
 =?utf-8?B?MDJLblFsOUJVNHQ3eWNqdmxORmU4ZWZmTHlrQ2I2bDV1ejc5bGkwVE9yRGNV?=
 =?utf-8?B?T0R0NkIwT1hKdFZkTHE0UHhjVjJ1elJmVDZxRVlVRWVweFQ2UDFtQnVNb3Jt?=
 =?utf-8?B?cytOeDZlTWpYcHZxRmJQamYxc295V0kyQTVTSU0zYnRuRkxGd3dpSmFjOVZt?=
 =?utf-8?B?Y1dSOVJhMEt2b1Vmd1dsOUhQcVdtOS9XQjBaeHFzbzVqTmhHZS9oejMwVEln?=
 =?utf-8?B?R0MwR09FZEx0Mmwzd0JqVXNobk5uQlYxM1pESng3aVJRTG15dWdobTNZOExM?=
 =?utf-8?B?NHh6dzB0OERCbnRFa1pvMGl6T2VCcWtRRFFLU250QnhybGZDKzVDNHl0Q3dY?=
 =?utf-8?B?U0FUa05EZDI1V2cyZTFCMmszSjhUZmVhUzFoOGtDTEMxT0JxTXdWNWx3Y1lh?=
 =?utf-8?B?RExDR3dGMnk2MFFMMlpFdldkT1R6TUNwZVE0TVFaYkQ0TTl3akVSbWYyd1E1?=
 =?utf-8?B?OUR2cEVFRlJSQ3pWNzJWcE9IRGhVYk1JZ2VDamZkalVFQWRMTzdEa1VBV2dB?=
 =?utf-8?B?ZEUrclJPOFIvMEd4S0FYWG5PV2cxR3NpU05LcTFFMUwvTC9DM0xJTEFPOWhE?=
 =?utf-8?B?bStpdmpEd2RpNWxVVllJREVHM1FFY1lzalY2N0tNZFFGOHVLS1BQbzJNUjFV?=
 =?utf-8?B?bkVjWWJ1dlFYbWtrYXY5T3ZyeXgraTI0ZVQvZEx2UllubXVMci9VaEd3Mkxx?=
 =?utf-8?B?NGtPS0ErNSswcWEvS1lpQ0J0NWpUMy95S3V2VDE1OXY3ZTQ0NExkeFlHNHZv?=
 =?utf-8?B?akJWUDVjRUtleHIzN3V5Wktqa2pleHRGTloyRjlyRjhnQWdic2FockVCUC9M?=
 =?utf-8?B?Y1JzVlhNaFJSajFyZS9GMkI0eWRMcnVKdGtlNzdIN2RCWjBSb0ZKUGxOc1N0?=
 =?utf-8?B?TkkrZ01nNzE5NU05aXZZNU1qWXUwMWlZRytscmc4a2VUY2preXh2SE9ud2xE?=
 =?utf-8?B?T1FFQWI3aGdOR2xqQVQ1Qks3U2JLWFptczdqL1JOdHFrRjNGd2llTlVKOVBv?=
 =?utf-8?B?WVQ3Z2o3WTg5MFllOXBzRFYxakdEUDJmemlITGhtbnEvbmk2VnlOQkxWejJu?=
 =?utf-8?B?Ui9CWS9ZTHpDeWMzaUFsVmdnR2VGR1RTQlZjSVdXblUrSW10c09wWVIvb0Ew?=
 =?utf-8?B?NXhPOHZmbGRtL3c1RitUZS9xQU9kUThnS09sV2c0ZmtQRWRocUlqU21hSFlr?=
 =?utf-8?B?L3Fla1AzQWVXOWt6Z3RQL3NsUS8wTWovYkJraHk0WnRaSGYyZzgvb1VDN0tp?=
 =?utf-8?B?d1gvTThXL0VMekZZak9yWjlLbUJJdTFmd3dtbVByVDEzK203V1JONGpESkJa?=
 =?utf-8?B?TlpoWU1SOS96YmYxOXV0M2VUdWNXV1RWU09ReTBmMUJ0c2F5YnVXMEZCWHNt?=
 =?utf-8?B?Q296d0ttanRtYVcrZStjS2pLb0M1aS9hUE5kaGpVQ09nQXVLbHpTZHNicThu?=
 =?utf-8?B?NkE0SDh5MFVTa3dVWUZLTll4VDBYdGtOclJhQUVqa3hVS1UwSjI1VzgxMExq?=
 =?utf-8?B?NC95aDM4OHEwQ0twOFIxelVQVmNiaUZYamIxcmFWV0xtTEJtWnFxZDNONW1v?=
 =?utf-8?B?ckdRd2tETDJRY3c4YVFhSElkWnBCU0x0RDl4NzNrRGpaTi9vR0FuTlk2aElS?=
 =?utf-8?B?OWRxMWNJT1FmVmdneVpRdFZRSFJTN2lDMU0vNGxCVDRheW56WmxJZGRjNm8r?=
 =?utf-8?B?dWJ6dTNxQVowVE4xM1FmeTRUc0xmeXFvYlVLVytJTmpiYmMvZDBTZExBTWY5?=
 =?utf-8?B?S09yWklXQXpmdTNCNE1IaUhxM3Nya3BOOTdoM2VhNklJUi9Md3hLMHJpK0ZS?=
 =?utf-8?Q?mJiAVN2NNI59y65cr0Z7Wz2p6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZS9yMURDYTZTeEV3aFZYRlZLSkVjL1FBbGhFdlJic0hSWG9hb3hML3ZabU5w?=
 =?utf-8?B?d1YrYTdBYWtPbkVSQTcxcmh4VzhBZU9MbC9mNUgvQ2FjNjNsWXdmREd0dEJH?=
 =?utf-8?B?dWwrdjdEOGY5c1JUTkRzTXJTY2hsTkt0UFlaYlJiOFZ1Nm9XTkN0RllGUGJY?=
 =?utf-8?B?dStBTTBTNlF4ZnlaVWQxS1d5SUZMNm1sRnFhWFQ1UDlxN2dZY1djYk5NMnho?=
 =?utf-8?B?WHdnbFZ6N0U0aU83SVZGSFloRk5sV3NldFdCRFZ2U3VZckQzcWplM29lMi9F?=
 =?utf-8?B?MTZyTklvU2Q0bC9BMFh2dzVvZVlVVkpKOVBtWGxCL0FuUnZJc0R3TFRiQ0NZ?=
 =?utf-8?B?a3d1K09rTXFQS0lMUDBJcmttQkc3blgvSDdXRkYvKzY1TWZnQy9rSDB5T0VD?=
 =?utf-8?B?UVUyOW1UQm9OQUlOZkZwS3dDVVdnaS9nN0xWbUdXRGYrbWZFUGhKU1BaYWhB?=
 =?utf-8?B?VzRlVWw2SU1MR1QyRW8xclJlVVFBQm1nOFBjQnhiZXJvZ1VVbnoxYkJxUjkw?=
 =?utf-8?B?V20vRmlBTUN6K0xtMTkzcHZrNW96c2cremI2clV6STlSV1RGcU9OV3lJSmVV?=
 =?utf-8?B?WkVtb0p3dXZ6R1I5cGtub3NrQkdLTUQzRm90TTV0YTJiaUNEbjZkZ1pBeVlQ?=
 =?utf-8?B?SXg4ZjlHY2dtcW9xRjFDMTBsSGMveVd5NTZWTEZBUE5FUHZ0cWluYUVmY1or?=
 =?utf-8?B?bWQvZ1pHSjNveGNrYmFqOHE0YkYycGNLNkwraXNVcUFZWEFweTBFdVFxMXJo?=
 =?utf-8?B?SitjenEyT2FlTmdXVjlpa016M21GbnJsYkJsVFRXMTJJNkRJa3F2TFlnMUcx?=
 =?utf-8?B?VGVPRXplZis4MkkxQ1pEVEZIMU1kcm5XUmRWcE82R2MxR0N3NHU5MmkyekxS?=
 =?utf-8?B?Y2hSbDJBR2VhbWhwVEI2M0xka1hZYnhiM0NpWnpJaE5ndXdhb0tIdVMxajFL?=
 =?utf-8?B?WnlSOENFOE0veFFVaHI4T2hVNzRQYVZMeWQ3dWxGNnZiUHhJNWZBSGNZdmFr?=
 =?utf-8?B?MlVVM1FNL1Btd2ZOVmpXM0FsNkxjaWNBNE1Jb3N2WG10bDZPTUtERlkwWjRk?=
 =?utf-8?B?NXhMbFZRSmg3N2pEV1ozTzRZTVFPTHVhVkdVcFk4eXlIUHRoeHEzQmgwbHBM?=
 =?utf-8?B?eEpHUGc5Nm15MWFEcGprVVRVSzFseXFpdndFM2N4R0k1dmdFWXhkdGhBRUFO?=
 =?utf-8?B?TnRheXFDRE5sOEhDY2FRTFBWNzdLMEQvTCt6cy9za1BhbUIrNWRFLzVsQjFU?=
 =?utf-8?B?Z2JJZU9jdDNGY3gwWkdxWDBndVh5ZTRCbWxhakowQ0h6N3N2emoyVXpMWFJz?=
 =?utf-8?B?QytJMnJ6V3FKVlhpbWpFeWU4T1p3bnNNU1hqeXJyWHJlckhZOWpCd2w4elph?=
 =?utf-8?B?N3VQZkh5V0lhWVpaMTJwenNWQ2RrLzUydUVVb0xKVFdwQkUwbU5yZXYvT0hi?=
 =?utf-8?B?eHZHNm16QzlLSUQxVHFOSDNHQjlOZi8zdXNIenl6anpwZithNDdhelNFejRs?=
 =?utf-8?B?ME16OWJkYU9kdytMc2VCMzlYV1BPeXNta1pvdEVQYkVwMEhOdVc4aHBiTDFz?=
 =?utf-8?B?cEhXRk4zV1h2WlY2WUx5RW8yMDhXZWVGNkQ4R0xJbGZlcU9KYmxFd1JseXFS?=
 =?utf-8?B?NlNPNmdRMlE0WUVsWThQOGFuSEJsTDNJMTRzQ0pKZllLS1V3aENKZW5PbHpK?=
 =?utf-8?B?RnNYdlRuMmRpWDBBTUhOZ3pmY3FpQTNwaDBydXFaRS9SZk9sbk5Ea3ZUb1o1?=
 =?utf-8?B?UXZNSWNRNXRxN1ZPMkI3bU1iVkxpTk16QWVRYXI1SFZQVWZkbGdGaTh4cG5s?=
 =?utf-8?B?cXFvWTlEaVkvM09oQVRkaEhSWER3MkhmZUtqeU1DU1B0VFZFdHZDWXhVYzNh?=
 =?utf-8?B?NmZ0V1pJMURFenhxY1lycWg0U0twM0dwS1RMR3RqdTJTREZQL0VoUzBZa1NU?=
 =?utf-8?B?a1FVbHc3ckk1dmpYZTFTU1A0YVlqTTFJTW1lU1JPQnpUbFArandib0o5L2hG?=
 =?utf-8?B?TnpDSTBMUXhGandkc2lCVnFGb2F3QjlXQXpJZnVsQmR6NmxKeUZtY2lDc2k3?=
 =?utf-8?B?VVhDb1NpaGJKbGZEQWRQOFB2cWc4blN4Z1RKR3B1dnFXbW5PRjZMOHdJc2lu?=
 =?utf-8?B?ekZhVDFhRnJaTXFRNkZobHM2dGxRdHVuMmRRTVdFTUp1dkRBSVZZZkpwcGtl?=
 =?utf-8?B?ZlBkY0VzTWtXdmRVdkhyR0M2RWVMZjZqNnE1alJlckpKK0REOC9NVHk5MWlv?=
 =?utf-8?B?YzFjRmhVZ0czaVR0NFZYd2N0L0RYdGxOZnEwYzA4YnN1L0hLM0t0cU1KdFRu?=
 =?utf-8?Q?Da8Q9FjTxOcKkiiAJu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bf7d42-1c0c-435e-155f-08de5f5f8575
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:55:00.2059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gx3ULtcvyvcTaDnB4g6GT88PBT8b4evJaWSL+XklLCqfUIV5ObSXIus016cBdDuJ35KIUb2nW9WVsipH1+VCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_095507_880186_E25B7026 
X-CRM114-Status: GOOD (  17.52  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMDM6Mjc6NTJBTSArMDAwMCwgWGlhbndlaSBaaGFvIHdy
b3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGRlc2NyaWJpbmcgdGhlIEFtbG9naWMgQTkgU29DIERN
QS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMu
Y29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
eWFtbCAgICB8IDcwICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcw
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2QwNDQxNTJmZDc2Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
eWFtbAo+IEBAIC0wLDAgKzEsNzAgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwjCj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsK
PiArdGl0bGU6IEFtbG9naWMgZ2VuZXJhbCBETUEgY29udHJvbGxlcgo+ICsKPiArZGVzY3JpcHRp
b246IHwKCk5lZWRuJ3QgIHwKCj4gKyAgVGhpcyBpcyBhIGdlbmVyYWwtcHVycG9zZSBwZXJpcGhl
cmFsIERNQSBjb250cm9sbGVyLiBJdCBjdXJyZW50bHkgc3VwcG9ydHMKPiArICBtYWpvciBwZXJp
cGhlcmFscyBpbmNsdWRpbmcgSTJDLCBJM0MsIFBJTywgYW5kIENBTi1CVVMuIFRyYW5zbWl0IGFu
ZCByZWNlaXZlCj4gKyAgZm9yIHRoZSBzYW1lIHBlcmlwaGVyYWwgdXNlIHR3byBzZXBhcmF0ZSBj
aGFubmVscywgY29udHJvbGxlZCBieSBkaWZmZXJlbnQKPiArICByZWdpc3RlciBzZXRzLiBJMkMg
YW5kIEkzQyB0cmFuc2ZlciBkYXRhIGluIDEtYnl0ZSB1bml0cywgd2hpbGUgUElPIGFuZAo+ICsg
IENBTi1CVVMgdHJhbnNmZXIgZGF0YSBpbiA0LWJ5dGUgdW5pdHMuIEZyb20gdGhlIGNvbnRyb2xs
ZXLigJlzIHBlcnNwZWN0aXZlLAo+ICsgIHRoZXJlIGlzIG5vIHNpZ25pZmljYW50IGRpZmZlcmVu
Y2UuCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFv
QGFtbG9naWMuY29tPgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAg
Y29uc3Q6IGFtbG9naWMsYTktZG1hCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4g
Kwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4g
KyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9jay1uYW1lczoKPiArICAgIGNvbnN0OiBzeXMK
PiArCj4gKyAgJyNkbWEtY2VsbHMnOgo+ICsgICAgY29uc3Q6IDIKPiArCj4gKyAgZG1hLWNoYW5u
ZWxzOgo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
Cj4gKyAgICBtYXhpbXVtOiA2NAo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRpYmxlCj4g
KyAgLSByZWcKPiArICAtIGludGVycnVwdHMKPiArICAtIGNsb2Nrcwo+ICsgIC0gJyNkbWEtY2Vs
bHMnCj4gKyAgLSBkbWEtY2hhbm5lbHMKPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogZG1hLWNv
bnRyb2xsZXIueWFtbCMKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiArCj4g
K2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FybS1naWMuaD4KPiArICAgIGFwYiB7Cj4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47CgpJZiB1c2UgMzIgYWRk
cmVzcyBzcGFjZSwgbmVlZG4ndCBhcGIgbm9kZQoKRnJhbmsKPiArICAgICAgICBkbWEtY29udHJv
bGxlckBmZTQwMDAwMHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGE5LWRt
YSI7Cj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAgMHhmZTQwMDAwMCAweDAgMHg0MDAwPjsKPiAr
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM1IElSUV9UWVBFX0VER0VfUklTSU5H
PjsKPiArICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjIDQ1PjsKPiArICAgICAgICAgICAgI2Rt
YS1jZWxscyA9IDwyPjsKPiArICAgICAgICAgICAgZG1hLWNoYW5uZWxzID0gPDI4PjsKPiArICAg
ICAgICB9Owo+ICsgICAgfTsKPgo+IC0tCj4gMi41Mi4wCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
