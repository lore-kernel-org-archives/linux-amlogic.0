Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D6606A333
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H8L4sx9N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=jc0k2rK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T2ltHXe6HnqYF4MEBQEiAqWz97zVJZZe7GfQJc8oB4E=; b=H8L4sx9NbDVbnh/pHmE/0JUdVB
	QCeAGNgsl5fHtxpCxIzyR4MS6fdxYO9nKGY2eEx2tTWPMFJpmj8q4e++Kckh+fJYi41ES40TVfmoa
	v6Iq+VpVlxxwnf1H/9a8/boUygO/d6fO8XmJDZPA/WoHKwtHe/egIQBjjsal62JUvwyEBlsnliWJF
	LXrFDfi8wFnGqf/oPhYNP1eIps8ZuKDBsd/5c3L8Dqr2VHQpBan81gIx38tS3ueXjtIFvDkiJ3/JQ
	kQCjSfRu8KBvkVjKJgNxRqrshSFAIQquRJTv9QA3ar5a/L2/5DTxtRbQGtaxRRqB83U99/nc2jjwr
	ddt5k3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUmC-0000000CNbY-3BqC;
	Thu, 26 Nov 2026 08:24:20 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUm9-0000000CNar-49Gk
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 08:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZwbbcPEtPJYwlZdAFvmLK5iwIK3x0+QDNi7KLivxpqUOYTUrrGY1UI2gxdCMGk3V4C//ficGPc6THENQmEtIO2aTLE61rqDa3T4V6NekeYwaKyGOt1BnKVNCPk4YxIfyRT86SgxgQt9CvQMMY2y7Y/BDCtsGwV66rnnBGLdP+jchxt5ruaYGKvotkPUufZK7vnS9wVZN+5k9Iis843K0piuTOmANcC7rYrhXQkdXIXxAW+QqLd/G4ImjQYFwPpwyY+qjEeoTum2F4qxzjDwaGrEVotLRNtPmtHftqm6OXhl4lr44iFmrHqSceqSWJthG83Y4RL46hW12Oi0XWwEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XYAynJwXY1DTWtJnnERfOecYaI8sKDCPCD5LFVAgQI=;
 b=ZZeiIkazS2srel4P8hxM+G1RcO7lotbDX1ZBhaN3rL4LVMDhMbUlUynUVR6a9r7MBZf3Sxhjk0+LMR46VNjPvsP6cRqaY2fmylC/gKCUNmVjSPy8oQklCIiLQwPJpEUnTJfMmvtLI57lf4laVvySQlkm+eccj9fgA0BNWt65bcLgpoKCJgVoSTHEkx8O84fD/TLIKMVZaP3nXo96bnD8sM6h984r1NSjW2i+pb2B7lCdeJnm+H3oNU+5mjpAJic4jmpSkNAbJk5YoeoAwGupXowfwt2FL9llmYBaqgigxPurYt0L+qrs73xw+8LCMqiPS0EO9qutN/Q0KCR/VCTS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XYAynJwXY1DTWtJnnERfOecYaI8sKDCPCD5LFVAgQI=;
 b=jc0k2rK/6nnt67nC6Ut2ulo4LbVG7YPRZUif1UhnWBM8HSrJkCdB0ZBhejGTDR3xc63mLkpYnAWsnc4gnepjUBdOLVBJr1kZd30Eph/JTYA32+9B8LkzGEgeJejY/6+wME0DcvoeXsBWPeHqHwL237IXbCaq5zqWy63jM3K0q2uTScWzXrB4LTFhAGJVH52EM3gLoh2DMzdASP294ABYlqhblHAnKqzBeJyOERDuZGTGf2bK9P6Rys2IWJ5RHu9l8L5YdeKpyOJ9Kj+Yb93DgOh/zx+gbwaKTNmzt5xsOgD+UtViwPY0Co8bmx7Hz7shRWE/gw9O+q6MpJ5/AyxpCw==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB8290.apcprd03.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 08:24:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:24:05 +0000
Message-ID: <4e82e617-3d59-4779-8d09-b01e3a7e3c34@amlogic.com>
Date: Thu, 26 Nov 2026 16:23:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Junyi Zhao <junyi.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261126-a9-i2c-v13-0-926e2072cc4f@amlogic.com>
 <20261126-a9-i2c-v13-2-926e2072cc4f@amlogic.com>
 <5d75177b-a86b-4728-92f6-87f37a51d4da@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <5d75177b-a86b-4728-92f6-87f37a51d4da@web.de>
X-ClientProxiedBy: SG2P153CA0051.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::20)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB8290:EE_
X-MS-PublicTrafficType: Email
client-request-id: 7e65d5f9-e5b1-418d-b5db-4174a182f6e7
request-id: 437c869e-0c79-4408-83f6-08df4b96a22e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10067099003|56012099006|4143699003|11063799006|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lW0OdPC0ywi2T017ZvisFGP4Ub/ZLX3UUQ5S27X4StlKNUFVLKVtxHb5MbGzHU9J02oBd4ww/jAIEU6Ad/8VpZ2XYr+xMx3S5LIJCiJiVC9wxfd6bNxSttnxQnqtnTqRaWfZNa9xPQucRjNUrFX6tGs4/4TPcctNpb8+h60Ccto4dJIHdsoEB9N17/sZdCm6DJ5cLaM4EIeqPrgIpS5KdITyxpT6tKHxgATmGjmeJlCT5jE8elonXCeo33UgjO/v2wbGMKpXAv/6rH5ihQnVUyq39jveXrQgTsY5CymWau2YRZSc+NCShvHoyQgImQwJepYMTrhd3vrfBGqVF/rFIyRsyea4THJ43as0BMqQSjENQhnP07DQPdnjyIBM3G79vf+TCEspqylBdqhR2sPiojDvd2Ogp/RyQDwy+onkacr+nkarrwBWaW0eDByzC0W2ofsjtJhGnLDb6XMpSx0maYh/aqG+oCRykLy7J2Dp+HIKnrqLMcO2Z4aTF/C3jBpaafyueBGVML7IrWdNtIe8OmunEI/aWR1QZdCmEGI9UZGjMhkRSuXAy7byD9yfyyBjfhiqSvivxAd/UjNWn10QKaUBH3xTFS/bYDoL/2sfxgMQogm7TCm5/onCNGFEVEah1+U4ZTtdC7D62euID1vOyySs4FvuCrMg4UldkR8u6MY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9RQjNoaFBmK3FRTHNEeWNyRWdyOEM0TkR2WHN3dU9mbDBDQVlDM3RCTVFz?=
 =?utf-8?B?UncxdDRTT1h6dk93bTBhNGk1OHpIZkZYa1kwOERZZTVPRVZ2QkVmMlJONU5n?=
 =?utf-8?B?bS8yT05WbWd5M1BFcVJJbmFCTFFCZGdiM2wxQmY2dTZSQ0F1ejNlV05kVmVP?=
 =?utf-8?B?eTVZWHEwUEFHZ0RZUHRSVXNPbXU0amhBbllEbXZSd0ZacFhoekNkTy9pR1Yy?=
 =?utf-8?B?blpMZGdRL1VHVGNhUXNnKyt6bHAybFNKRkVUSzZPNW5PZGhidDZuYThEaytN?=
 =?utf-8?B?aHVNTkZnRUFFcmo4QUo3MHVPZ0hLbFowL1NuWFE3ZFRlZzhrMWhDWXUydERs?=
 =?utf-8?B?U1lyUU1JcDJycXg1WThYMnVDb2IraDgwNDhwc2VPRll4b3J2MVBpellScVND?=
 =?utf-8?B?dlkyVm43NUh1aXN1YmlDK3pGUjdjUUJEZy84WmpxZ0tMQU1ORzJSMHN4WHND?=
 =?utf-8?B?ck8vWnFDeFM4aCtCV1Jacm5xUUhJZ0t0bmIxdmxKVTd1dE9HUUxlQnI0aGpX?=
 =?utf-8?B?S2dPTk94bnhHcEEyRjlWMG83ZEhPMjdRdVlZZzZHY0hyV3AxNWhkM3JJU2ty?=
 =?utf-8?B?SGdwRWRoUWZWT3RQeFRsSXB0amt0bmFSMWtKSmdGWENaZHF6N3M2VUcxYVV3?=
 =?utf-8?B?Z3BDcjhqRmJPQ3JWbU5hWkNiaWNuUk5FaG9jOWwzcjROdXVXdkFYOWdVZ2RY?=
 =?utf-8?B?NVFvd2FqUHlzMjR0QzZRU0ZqTGxacnp2d2JyYTFuOXZ5VHBrK2NGcGhYYk9B?=
 =?utf-8?B?SGc4ZGxrcXFHYThzLzAxUXZaTlUySG9temJmYkpxeFRDWnZkUlVUNS9GUWhJ?=
 =?utf-8?B?TTNnMkZ4YmZrTUxNRTR6MVJ0VFlqaTRKb0pPS0FiNnZMY3RyaVhhUzd5M01U?=
 =?utf-8?B?ZXZJMm81VCtmWXlXRkxOd3ZlS2VzaUNSak5hN3J2MGNCeG9BYmxLVWFzOFZP?=
 =?utf-8?B?aFJxRzhIRHRHV0Qxd3MwWDRKOTkvcGpaUzA5WlkvVXduVjVPeGZHR01VdUU0?=
 =?utf-8?B?VEo1S3FsUGs4eDJ5UmRpcUV2RVJIZUhXQnVsM0lJQ0NiWFBreFdJSERsOHhV?=
 =?utf-8?B?eFZwd0o5UC9oVC9KL0ptQU5xRkdSUkhvUGg3dHpkTnBGNGNJOGlRQmx4QXVh?=
 =?utf-8?B?d0NMclZSVjA1cmVrWVhJRUlKUExqTnNJNlkxRlpoczQyUWZCTDNxYjFPOWVn?=
 =?utf-8?B?SzZGK01RSGRpWFRySGpvd0RXbXJOUUJSb0diaFVHQ3J3cE41aldqRFZPdkhm?=
 =?utf-8?B?RnUzSFcyMlRpZjdPOWlBSWxBQUlnbWg2NGtONWh0SW53WU1lMzU3TWFUcXlT?=
 =?utf-8?B?a0RoQWhPTUExZy9lcHlpaGo3aG0yMStZOXdMUExvVDBoUm1BWGhqV2FFNU8v?=
 =?utf-8?B?L2dDKzBHVjVwRHdYQzU3ZXp3K1hiZytER3ZZRm1MRzBTUk1CQmsyTzVYZmpW?=
 =?utf-8?B?NjdrYzVjZEh6ZVhpZW9sVmdoSko4MktWNVlsQVFaYXJxK3dBbldJVTgxd2Fq?=
 =?utf-8?B?NkhUZE5DVDhqeTZSRC93N1ExOVdLcUZmeHBtakV4Zk1sTlYyRGJUZ2MxeEZU?=
 =?utf-8?B?aDgrNGJEdDdZdmxUejRTWW5WWG9RR1NSRnJWZkU5K25SN2FHbTZERmJmK011?=
 =?utf-8?B?ZGZrWWhJTnVNNmpaOXZQZXJOcDVvSkxFOVp1Vjk5d0NwZXRWNDVWUDBrUzRr?=
 =?utf-8?B?Q1JZUGwvcll3ZUhJb1NicEZRWUVBWi85c1R6VitydGwxNVVqTlFVRWJlUzdT?=
 =?utf-8?B?WDE3ajVVdWFtMGJjTGxpWThMcVNVVlcrcFZtRGxPL1RQR1kyQW1NTmV4aUdr?=
 =?utf-8?B?emg3OXNCeGpkampaVmdaL1hHN1JPWVFWZklieWdyNjVZLzY4N2s3TGpzdDJl?=
 =?utf-8?B?RWNSN2FQRU9hYjNjTlgzTkRKSUQ3UEFNQjJNeDFiclQxRGJDSFVuMGZycFp1?=
 =?utf-8?B?TVBrVjMyWldYYXBEWHJnOW42VkJNYjNBaDBLMkxaYVhuUDQrcnBwQTU2NTE5?=
 =?utf-8?B?TkVPQzA1VTdnd05yMVdBYWxOM0VCeGdXalloT3VYTnF4K2EzYXE1cEdmUW81?=
 =?utf-8?B?R29JV1pKREtpS2sxdGFDcFlMYVBzeVNNSlJUM21EOVdXN2RWY1pRY1llb3Bo?=
 =?utf-8?B?M3VoOXhkUTdNZCtkaExzUXJJSU04bHNlU1Z1Uk5KTmZJVlFSc3N2S1RGZlVZ?=
 =?utf-8?B?QVpBSUNUaEg3YjV0anNnWWpQREk4eEtXdFRWdHFranRWQkpGSGZVWlNUc0pz?=
 =?utf-8?B?dXZjWlFrQWhsclhlZlo5bVB3ZTNVdFlVT3ozbjY3WnhTd25uSFhzdjZRYm5m?=
 =?utf-8?B?bm5aOEJHRWc3ejAwckJWeUdEaHMvNmVrTXBidXl3c1BKbmZwZ1UxQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437c869e-0c79-4408-83f6-08df4b96a22e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:24:05.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPGm1C1qtGoBiJoDukCaKnIPhMtNReYR0mpw8SckOWAtLq2GlmkairXohA3ursZo0m5WWz/ALbFs8kkqMf85bmn1uSeNWxghAE0dbZQPAp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8290
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002418_059259_1BA67070 
X-CRM114-Status: UNSURE (   5.62  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFya3VzLAoKT24gMjAyNi8xMS8yNiAxNDo1MSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4g
4oCmCj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYW1sb2dpYy1hOS5jCj4+IEBAIC0w
LDAgKzEsNDI4IEBACj4g4oCmCj4+ICsvKiBBbWxvZ2ljIEkyQyByZWdpc3RlciBtYXAgKi8KPj4g
KyNkZWZpbmUgUkVHX0NGR19SRFkgICAgICAgICAgMHgwMAo+PiArI2RlZmluZSBSRUdfQ0ZHX0ky
QyAgICAgICAgICAweDA0Cj4+ICsjZGVmaW5lIFJFR19DRkdfU1RBUlQgICAgICAgICAgICAgICAg
MHgwOOKApgo+IENhbiBhbm90aGVyIGVudW1lcmF0aW9uIGJlY29tZSBoZWxwZnVsIGZvciBzdWNo
IGNvbnN0YW50IHZhbHVlcz8KPgoKV2UgdXNlICNkZWZpbmUgZm9yIHRoZSByZWdpc3RlciBvZmZz
ZXRzIG9uIHB1cnBvc2UsIGFzIGl0IG1hdGNoZXMgdGhlCmNvbW1vbiBrZXJuZWwgY29udmVudGlv
biBmb3IgcmVnaXN0ZXIvbWVtb3J5IG1hcHMuCgo+IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
