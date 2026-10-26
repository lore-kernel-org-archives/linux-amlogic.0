Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EB3606A31D
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 02:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kqdo7Mly;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=J5BeAvng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HP1rMrRcOOwhAKK3H/XRF6sCMiiRU7IfYOHAfQQilxw=; b=Kqdo7MlypZcYSQEP6FqJhH41AK
	wHQC2z15qBK810IqLh3YxVxYmE+pDj+ELcM0Mr4B4IbKkhwFmni0+EP0dDFxzh7dppfix2AQkuanQ
	DmGKjVz5ovPCdvcJrLwIxmGzIZqxaUShIlA7E+tZ66wiPcnbCN7FzZ+kYwprIulE1IDJvufuYFqQ/
	g9Nun9u90cFc5ACPSGB3Q7FttIphUVVaOL3Qkd2KTMiwFI8iBSYKyoGcwBSpu+czbrnQD1GB8+lxk
	k4QyYuCyyRFU9BII4wsA49zqDT+cj0whxGT4zFKLXJEvo6iORmvdjWX0djX1Zax+hCYFOvk4wMBgU
	KHXlhhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAhD-00000001cuE-44tO;
	Mon, 26 Oct 2026 02:44:23 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLAhB-00000001cth-3Omg
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 02:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DricoyTGdfHmSqVl+shkUdvwiLqAPy8bIs7cIV3Xm0ZgDxkjPOmK1jOezAQsY34T1Ltp72pTEihEULEyzlX70iqvin1UtMpnPMI4ekegMedF/mTQkCPk0z0K6GQP9/OsOu3vskghOo4y31yxxVUfp2BhPWtKnpauGas2+veTEGbW87WM73SNgveRmLJf2AxgdhIo6SVZJlLEBg28LDcP84pIpn1K+hzY8pUhsVnG+R12SRsqjUXGrwNMxEm403y1yYTTKYTU9omq+CdXk2a8t3inBDTP2UzImb+yu4X2JkguzWWLS9sPBirAzGQ/kaUAfZyzJVNXan98zBYEnVANLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9e6J/VYm4kkYFzYc1qOkhHPCELaK8sXDMttf/XTr2k=;
 b=knzoAJmovmP4zJeyG3Aaz6doyjYBRoMmm4L6gAJQrLh85xHocWnYNMyWhFIv5ih5/KClVDNhUFJqAYNGrS5/+DIy/0Qei6GtFINYj62qHoHd9aBNm/eZN7yjIefsISeVEzPdPUsE1yxosasReRZyELgJ63R/95t3bJxGtH2p9Ic+CHcQDoAuajXWuSl3TWlakQbTF3D44fSEsbE14OR/605lF4MDUJhbrxHxA62dT3NFats3Bo4hYKd9+pR+5KexzxKVyDNNE4xRnqLsQP3PgE494HYncrtY806aljHFDz51jR7b4rkekalDaF5HnIILRkTVMFDSuHwAtOW/iGMw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9e6J/VYm4kkYFzYc1qOkhHPCELaK8sXDMttf/XTr2k=;
 b=J5BeAvngk9odMV0Z5rdwxNk/9Uws0TnnOR/M0nkWHNJGnIG5OKKL2oFIqRBimX8Lq9npLhqNlCxTq/tChnNTD0QeS6bjKpJEsdyjXSwO8XLiAfnmRfSadEozCWmnvyJTAZukTn6u7MRjVmB5Au5JvXsaWYl8J4SK5QaUQ/PTzY4H5AjTBVdo24z2XUWlKDCEGoDASiL4KjFoHvGH0miZ9J8cqQ/JgPazMBNYreyCL2qI64+BOwrBZ9Rs+/Dj+8OWmGDuiWVRQqha/fJ6ljpctSKSK9Tv25eqRG3UoDKcRxEX+mwuL9azPTDE/T11+WRH8qGPUytiA8/AZCzXYdGIuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KL1PR03MB8143.apcprd03.prod.outlook.com (2603:1096:820:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 02:44:14 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 02:44:14 +0000
Message-ID: <ecc2b7f9-b227-4571-8bdc-0366e4fce859@amlogic.com>
Date: Mon, 26 Oct 2026 10:44:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: amlogic: fix workqueque not free when probe
 failed
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Frank Li <Frank.Li@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>
References: <20261023-fix-a9-dma-wq-v1-1-b414de837e6e@amlogic.com>
 <ad468ad8-c7d2-4737-ac43-827fe02aec04@web.de>
 <d12ba4c2-cf68-4710-a9e7-42abeabb601d@amlogic.com>
In-Reply-To: <d12ba4c2-cf68-4710-a9e7-42abeabb601d@amlogic.com>
X-ClientProxiedBy: JH0PR03CA0039.apcprd03.prod.outlook.com
 (2603:1096:990:74::29) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KL1PR03MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 84641b9d-3ea4-4110-534f-08df330b056b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|261009223027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: 0lUMo/5q4iPYPGUz7oH27MlHJfcifoSDdDeNoX5aU5IeWm6n2RAep2lRCk50Fv64WlZrU1WIXegmtvq2G65bL5CZhQ/Whmpb2KL+06QbqBQ2BvSCqSj2ob8i+aZcBMLZVtKuh1IkUT4oPkVaVtGkNEuoQdiHM1h7QGlZhUwrT60gMOAHBRQgtZ2RZQL1zz6L+eCJPeKoNzrTkHFlz/Znx+KZAe9rvil54vq4L22amAgPZJlSGdghwCZk5oVtti1YW5kl1nlgY65N1TNTaQCNSz08FrpJ69dAxPw6kau1BGvIXlVFrmbYCEU+PeZ6z9FQ0I2IyU+b6r8wbQ3MwhTpQp2cRCKKRGL70DyesCrpTwo47AXoNIAzspKrQBmNrqhBD/qva+PfJG+y4hwPJ7rpZFXfqZTDcoBS9aKB/FH8uktFkyhiee9JluYIzS6LNkt3VmHKLeJd1qvonPHIQckqR1gKSBamI0zxtskAfHC99N30DcayHN/9AYh2Xb5U/kxkxtlgj8S8Ld3YK5dixF5b39j7kWcIhIBZ271A+UKxwrg2wGm7ieRR/1UgXFR1bvSthoky3bW8EJRKL0I4BkY21vjd11BctFcx/DJBMLXYXoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(261009223027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVXYmV2Z1Q1RGM0enYxTFE4bDVtcE01L3JXemJGOXBCYUhtczVMaUR3MlJ0?=
 =?utf-8?B?bm9scm04R1ZWeTNOZmtBVjNvQVJ2ZUhycHlNTXB6d3JSTzIxSXpuMmxuOGlY?=
 =?utf-8?B?bG1PMkhybE85bUxYTGsxQVM0TEFVdElBVlRNWXhWNlBBUHNBbkVVK3dFWVNa?=
 =?utf-8?B?MjducHFIUS8wcjBrd2s3OXA1UGlOSnVEcjdDVWlwU0hab2VQbUl4eG9EUjNz?=
 =?utf-8?B?bys1U2pVaDloQWUxN3JoWUJ1cWV1M1pUdjNGZGNKOG8yeDF5eE41TmVKNDBt?=
 =?utf-8?B?SEVmSU9RdkhhVWRMNi8xdkk3UzhJZnR4VHZVMHJCUDB5NWZXRUhOZVJramYv?=
 =?utf-8?B?dzhYbkw1QkRmKzVPbUN1VS9wRHlZTS9CMnV4NnVmSWVBV3ZIbnQ4WFlPUEhQ?=
 =?utf-8?B?R0lLREJLcm5oc2NTMHFoVGdER0R2OU1YM0RmOEJaZm81UXdMY1RBcEkwZ0tv?=
 =?utf-8?B?Qnk2SFo2UFFmUU1Obk5YcEFsNTNESDZMUEhxZ0libkk4QXJJU2tJc0Zxdy9Q?=
 =?utf-8?B?anVqQ2pmb0JEblhDeEVvNU5RMmZqMWRsdEV0NGxCMjZsQnEvQ01FVU5iSGZH?=
 =?utf-8?B?ODQ1VlBYQUxhekVyYkJvUGRVbVIzRUpHTlRPb0dDdm1qbW1kdmZNaHRqRDEv?=
 =?utf-8?B?MzAwQzhYbnI2WGYwbW5WQ3ppZG1nVFVPSmtjUm9uVWNxbW5xTTNPcVlFL3JN?=
 =?utf-8?B?clo2YTBmdkg4T05xdUlpbHBVanFqMTNjSWJEdEJkNHZ5VnFyWHBjVG5mMk5X?=
 =?utf-8?B?SWtkVHlxNUFSeUZVSTAvbmVIZ0pnVU1LQTNvWFNZT2RFYy9BL2RqbHRyZHA5?=
 =?utf-8?B?ZGlwcUNzSm9TdjRCMGxWVEFjaHZveXFXMCsweGVOWmJ1YWV6TTJ4YjJVd29s?=
 =?utf-8?B?Wm4wam02UWJwSjhLc0pGd0lId2FaWnloY2xHOVBJMGpzNXFrMzNwb2RQUFFx?=
 =?utf-8?B?SkhZcjhFSTk3Q1h6em9vaEZJWVI2VmNBdHNZa3BoQ3BZMjJGck1nQUo0Q3BB?=
 =?utf-8?B?M0p1RzJWcGNCUHVxZzl0dTlWaWEydkwvM2U0M0hQZE1KSUE5Q0p0bGFFRnVK?=
 =?utf-8?B?eTc4dlQ2Z3B5M3NUdTFTaGh1ZXJ4eGptTFl6NFY2Z2tkTnpjYlZXNjJXb3Y3?=
 =?utf-8?B?aTV6aTFmQUFnK1JrS3FaNkd4UEQvQ0RsWE1hbE0rRUkzdmhLb2Nta1FINzFE?=
 =?utf-8?B?QmllOW4vNFNQOE95M0ZnNnB1bTJWVmE5RWZCdjBCdXJzZ25xV0lWUU0zUDJh?=
 =?utf-8?B?NlhleU1qN3lsTGxQWmh4QWUwU3BEWG4weWJxVEcvaHo2MlZUTVJPU1V1TG5U?=
 =?utf-8?B?SEJSVUdCN3lRTHFSd1JHcFpXc2FLd1Z1UmI0amI4M0swQVdGV3F6L2tQVjU4?=
 =?utf-8?B?bFZIZlllVVlwTUtPQUQvZkhYTHhzZlVzL1d2WU52WktvZFNTTHpyR3hrOVZl?=
 =?utf-8?B?Qk1xb0N6YldyUzdLUVlPd1F1b1JTQVNmWXByYTl1YzRsc1JuTlNCVmMvVUF2?=
 =?utf-8?B?MEUvN0I2dmRmWFVxTXgzczJid0RiZ1VJM1RQQWRFU1RnYTFKUkxNMjNiemRk?=
 =?utf-8?B?RTZWTTdwMEkwMjQxcEk4enFpRmJvMjhrNUJwSnBFRXl3VWp1TEFTTTRucVhU?=
 =?utf-8?B?VTI0eHAwSTdPWCswUTZaMllhdi9VN0grZVhEK1AwZTZKR3k3UUlYZ1VOY3Ax?=
 =?utf-8?B?R3hYeXR0ZFRKZVN6TW9kdUQxWEMvZmxlU1BMQ1gvcCtQcjJldGZSZGVWMFlq?=
 =?utf-8?B?R2k2U1NPbkZDQ2M4TkEvWFNCaTMyWVd4aytTODAvTnh0QXFoQkJtWFBWdjh6?=
 =?utf-8?B?TWtvL0pXNHAwcU11MVdZS3JodkJTaHJicDd2dUFaU0NsdkxWMjZUZkh5U1NU?=
 =?utf-8?B?VTNRVnZ0UXZUU3RkRHNOSVF3RnQ5L1dBUndhT1oyL3hjVlVVM1FlZVdDRVhh?=
 =?utf-8?B?VUd6WXJSS1VWZEFwaHdudlpNSWxrVEhjWHNYVHRhZWRNNjltNDlsNjZSejlK?=
 =?utf-8?B?QzltVmZzZ01QZWZQTnNPR2w4UFNnZFF3YXBSZGNMbUZ3aHZydlFTUVR0RUs1?=
 =?utf-8?B?OURLOWtsOE95UFYzZ0tSVnVEOHdKOGk0Q1RFRXMwN04zWFBKWjVXYURINnRo?=
 =?utf-8?B?KzRPbGs4L1JaZ0JqdlprcFVSclA2REkxSlBuVzMwc1JIdDNYWWFKYlkwbkRG?=
 =?utf-8?B?cTNHby82ekw1MmxucTBZYmpoMVlqR0ZNMGhXalhKSTZxaTVKZ0ZqT0Y4ck5z?=
 =?utf-8?B?TGFzSkhFUm5KUnBVRnB2cWNSanBOeVNYWW5LTnpXVHIxNzZvb3ltVkpwL0hX?=
 =?utf-8?B?bUZJYXByeDQvVnBqTTlPaVozMEdYNEs5dHpxVk4yYUFURFNMdnI2QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84641b9d-3ea4-4110-534f-08df330b056b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 02:44:13.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7T3L6b8TcADX6S+BkZiKFtJilyAIVkIZh3O7msXPMiPhLzgEY/a0Twkx2HCOF9K/W72yZw8yP6Mb5zX+V8ykd4n8waoRPrepzJ0JqYyTl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_194421_850470_BDAD7FC2 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAyMDI2LzEwLzI2IDEwOjMwLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4gSGkgTWFya3VzLAo+
ICDCoMKgIFNvcnJ5LCBJIGRpZG4ndCBub3RpY2UgdGhlIHN1Ym1pc3Npb24geW91IHNlbnQuIEkg
d2lsbCBkcm9wIG15IAo+IHN1Ym1pc3Npb24uCj4gCgpIaSBNYXJrdXMsCiAgICAgSSBkaWRuJ3Qg
bm90aWNlIHRoYXQgeW91IGhhZG4ndCBzZW50IGl0IHdoZW4gSSBzdWJtaXR0ZWQgaXQuIE9mIApj
b3Vyc2UsIHdob2V2ZXIgc3VibWl0cyBpdCBpcyBmaW5lIGFzIGxvbmcgYXMgdGhpcyBwcm9ibGVt
IGNhbiBiZSAKc29sdmVkLiBQbGVhc2Ugc2VlIGlmIEkgY2FuIGNvbnRpbnVlIHRvIHN1Ym1pdCBv
ciBrZWVwIHlvdXJzPwoKPiBPbiAyMDI2LzEwLzI1IDE1OjA1LCBNYXJrdXMgRWxmcmluZyB3cm90
ZToKPj4+IHdoZW4gcHJvYmUgZmFpbGVkLCB3b3JrcXVldWUgbm90IGZyZWUuIENvbnZlcnQgdGhl
IGRyaXZlciB0byB1c2UKPj4g4oCmCj4+Cj4+IEkgZmluZCB0aGlzIHdvcmRpbmcgYXBwcm9hY2gg
aW1wcm92YWJsZS4KPj4KPj4gU2VlIGFsc286Cj4+IFtQQVRDSCB2Ml0gZG1hZW5naW5lOiBhbWxv
Z2ljOiBGaXggbWlzc2luZyBkZXN0cm95X3dvcmtxdWV1ZSgpIGF0IAo+PiBlcnJvciBwYXRoIGlu
IGFtbF9kbWFfcHJvYmUoKQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kbWFlbmdpbmUvMTNh
ODM1YjE3NzBlMzYwYWY3OTkxYmI0YzkxY2U1MmE4ZDAxZTMzMS4xNzkyNzg1MTU0LmdpdC5jaHJp
c3RvcGhlLmphaWxsZXRAd2FuYWRvby5mci8KPj4KPj4gUmVnYXJkcywKPj4gTWFya3VzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
