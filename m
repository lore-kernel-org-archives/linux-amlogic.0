Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A6DCD342C
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2026 02:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lKV//ZGr832B1l7GnV+VTJaJmlng/Egxf0jfvxpyQs=; b=rs+qbC1sY3O/MqJCvU2fOjjZ2z
	X+/VNyxjDu9+AUoZqc5GopdEF6daoVYf2HRxMfC+eowz2xs6uJpYyzZTXtUWKbGT+JHzlnCd+PfhD
	rqc9blowZJKE6REndVp+ltb3tpZLlUuHBJrX0tSx5milc4Riq4vnKxrv5SPGfE9rO8Ew/g0/9qvue
	vR+p2BNyrdRPUK8P5ez2igmEuU6Dae3OEBAOx1brKJkjGXCcuCnEDP7nbC2frtrcU6sZujzvLD54J
	x9ON+AHjPuvqyxB5bErNhf1xIW1vFgY9u/m3fjzPInXvXCNwx85H7JiHm8T4OAQWtr57SeyKWutji
	psIPaYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoi9-00000002YpT-1Qfm;
	Thu, 07 May 2026 02:43:37 +0000
Received: from mail-koreacentralazon11023118.outbound.protection.outlook.com ([40.107.44.118] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoi8-00000002Yp6-2v7s
	for linux-amlogic@lists.infradead.org;
	Thu, 07 May 2026 02:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJCp27nzKda0dR42WGSwDlX0t5bcwCazOTM9eTAIMaYuXpEdrLFMGtzYhPOCoZubhingJjsr4EuxToatWRqAapaDAtxDjc23YdFE43jSoMM/wjYmcYO6kRjPupgqiQbeBarIVIMhq4B7TttvBRVlDHMWWmOujkNyEoPI6i66/eq4E97LDvWVC+hdoU87X11N6Y2n46L3hgqCoKOsjSbLltYJq21Rr0mo+wApjNAFrz4Ff9oFLWg6c37xX+2S9s14LIUIHKg9b5HifQ3Wu09kBqv1cNkNmhjwu6ISwpyAgmfSPW9UKSczhadK4C8I2ZySn8Cdp4y81BoW8LDu4crwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym+xuFfNMpg2Jx6n6KpDzJAW81pS6FbbrDUHmXjder4=;
 b=El3gKDYXv+4A63+HHiu7DIenCQtYqFqEgyjFR6T5gzFe8CU4DnPYs0zWKL6eu2zssLBg94qJyX6MO86z+8oNPOgQX3fz+Fg9NMiXD7VjrJ8QnmiRk6gICX5sdrq9lpI8XeaZ6aGaErIvoDl+Grw5pJ6D91v6kiQ9qBd0J0fTXsOciQbWCM0aGGYR0/XRHVU+la0WLsU51hHRd+jIAjxVsZm4qjhu865+Y7trD1WHkt51ji+0O0l8O4TR+7s6P9m1Ln7YZNfw2V0tOgz+VBhQbv2tk1gBRmlroQV+8cELHwJdv+VjTN1lZCE+shju8LGGulBoKYLDyFv3rxMY6CWs4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym+xuFfNMpg2Jx6n6KpDzJAW81pS6FbbrDUHmXjder4=;
 b=RvbmD/s4EMOfSDLZ1dB7CavaFgxQ2+eTDTVwdavRE3Q43/+aOH7nUWirjWcg3cIdvWB7CsN0WjtH3UPD6LvaBxIUh0Dgrd8ytsHY2KQVuieNtLNSzoF+fFEW8gXcSB8xJTeN29TS2Z8KEb4jPZLxGnPz7QYLBwdh6ktpm7K1LQiYh9x9m1a7wPWVf+woWKMVVeG2V5K6lm2aPupQymeIVaqo9/gNtgEPgMvRgdfZJzDF0tmsWjd50yh8fBCNuppVq3ejooxUA18mfrSlMw2tE4nf0w5TuI6mJN4vfiFzMQp1W76zHjSVjXjR8uMf3VCTvKj1L/oOCuYZqp+8NFeUVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7399.apcprd03.prod.outlook.com (2603:1096:101:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 02:43:21 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 02:43:21 +0000
Message-ID: <b2e9d31f-1de0-46f8-b457-23db3a00633b@amlogic.com>
Date: Thu, 7 May 2026 10:43:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: amlogic-spisg: drop misleading NULL check on exdesc
Content-Language: en-US
To: Stepan Ionichev <sozdayvek@gmail.com>, sunny.luo@amlogic.com
Cc: broonie@kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260506183513.482-1-sozdayvek@gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260506183513.482-1-sozdayvek@gmail.com>
X-ClientProxiedBy: TP0P295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 666c2ef6-3d63-462b-b144-08deabe266f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: yhWvQPe0ontoF0u95F1uijxm22KoDcmaa+/Kf0cKcU2lEM+CsbTdr0rrP4vW8nYzu579mJRgTWMifL2tCD564jbFZhb2GbKefP+7jcEXgFEwLpnsPmvUU2Ym0X9tALFHH5IPahJ/MKIkWPySEDJGs+sTbZYo5kZ/0annzCqT7/VQ9W3wCW8NYXz4nim8dRRnd+UgZ0Fztmfrk0w0oqIb6Uds46xask7TCXvE5CleB6Gr82VGlc4Q3TY5xe4yg0WY8hpQfOUyel24rVFy26/sshkHoRXR6xMqDGOj1NcJTV2clVadEQoc8o9oaHjVPoFB1XRJXi33EuYnEKi/HT8dKsxqkmgcGKYH6JDMgIwzlaPZvIXXbFM0PV1Old4OMe96O0N30p2FfkfOc/EKQH8v5MQqUQlqQLAJ938sniPHr23GoM03vrk1UP3Ep45+54Lzvl4xEgMff8MrUpWHtzMtJT/VFgAZ56suHOMKNwdvq1BeRjQS/Cff5G+C8gxgBa8U9Gi30YMeGa4oljs0LMcJi+SLTGBR431IF2y4E0L0hxT0vWc0aBfjukmoTCU7hlNikioJCryDVKeLHNtCvNHgaIDW1kb2wzI3FdTivvXqp5EfnIGkpjpEhmIlV32Otnl7ZdwCwvRZzF5XLIV/DymZY2jQ44GFnSR2hwU+sh/PUW8HoV9AWawsquaXhe2EQ7dP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2t2VWhRWmZMcUdwa1J0WExlWE1yc3drZHozQjliTWg4RUJTRVJKY1ZYcVhD?=
 =?utf-8?B?bVE5cFdkSjJwMi92aktSZGEvcGNZdEd6YnUxZnVPYXp0a0JGc3FMMzJvZjRO?=
 =?utf-8?B?bGhoK01oSGg5QnRzVytWU21HVjAyQlBCd2tuN2tOTWlMOTllcWJlWHVuR3ky?=
 =?utf-8?B?WVBkVmh1T1lscVBucUErTUV2SXFENlF2MUZIOHpXOUZCQ2wyOWtYUGxsdnJu?=
 =?utf-8?B?eHpXSXZzWVc4dW15b25Tcy9OYnE2Q3I3U1RSZG9xRFR0eG4vUlpuWU0xOWlB?=
 =?utf-8?B?bTF5a0xsK2lGdU1HY0F2V0xyL2piNDdlaGZ2bzJjQjFmTXFEOWMxMnlpZ21Z?=
 =?utf-8?B?VjMvRWxSNDd2bm1EOElCYmVucGdVMWVOWi9Qb0puTVZXdXg5WktnUlhWNDBI?=
 =?utf-8?B?eU5mZldocVZtRXNudTdvaWlhRXErNVBSNEtqSWQwWlZvMWJKbStpR3ZZZWEv?=
 =?utf-8?B?RElwaDdQQXdHT1lsT2xFNkxQYUx6M05YV3pQakVNamh2djgvY0ZwNE5lZysr?=
 =?utf-8?B?RDRJRUdyTXVXT1BPYmtia3Q3Vm9MTlZETVhYM0FQT3o1QXNTaFZTdUhBc0I3?=
 =?utf-8?B?WlhkclNOekdEanJiSCs2cWN5ZUFGd0czelI2WTVYOHFLd29CQ3F4UWwvR0pS?=
 =?utf-8?B?dFVyNkluK2Y1SWJrdlhLd3RPVFhMTUM4dEdhSDFiZ0VEc3pZQURPYy93b01l?=
 =?utf-8?B?QjBkWDQ4dnZ3UG5tQ21LUjV5bG8xYUtvMGdJS1JKUHNsRmZLTFVMeGR3SXY0?=
 =?utf-8?B?Z3dyNjc1NHErUE40KzNHRG43em9uU3N4SlJYU0pYNUloQlc4dTJKUWI2eDV6?=
 =?utf-8?B?STk5TkVXckQ2SGc0YkVONWpadFpZOHgvWExJZngrMEd4dUJYVTlBdjBlYlZX?=
 =?utf-8?B?UVJOQkR3VDBWakFwSVAzOENMcnVQNW9VcnpUMG8zakJYMHp2Mkl2RSs4Vm9E?=
 =?utf-8?B?aWJWRlAybjF3MGM5YThuaVZvaHQrQ3AvQlZjakdrNXIvSU13dmZqaUFueDNU?=
 =?utf-8?B?TVZlMnJ5VnhGMDh5cWhMM21FQi9CWXJ4RUZtdDV1SW1COVFCSloxWGZjWDdh?=
 =?utf-8?B?dDA5SnBPRExCT004dFJBeGJLVHp0a0Q4L1FnVkdoaWlFM3Z4Y3F0NmJkejVk?=
 =?utf-8?B?UnkzakpwZm90a241V2pWL3FtQmw2QzZUWjNITHdTcHlzcG1FWG1zL2QzQUJJ?=
 =?utf-8?B?THM2d1ozbkFRQUt6aGlsblRLK3R3VFNBRlNycmlJRktDamNQQ1lyNUJWcWdX?=
 =?utf-8?B?dnhTWUY3cUFjSFBmaFJJMDFYc3pBcE1uQmdRMVloZTJIOG1oTnIrNnA3UTNp?=
 =?utf-8?B?a0FWZHpQZnV4ZTN2S0RlSVJIc3E5bFNNa3RsRUFvQk9TeWxkTXlrZGdTQUgy?=
 =?utf-8?B?K0F5NVd3Wm5LbjF0djZOZTQwVDNjb1VQTS8zZDBnSkxvZ1RqTG5DMUF6dHlz?=
 =?utf-8?B?K0RsaTU2dnpVbVdQbmVpN0Q4Um5JaGlZU0V2VGljaVRoZ0JUV2lSTGRTTUFN?=
 =?utf-8?B?aDBDNFpXSDJQdDdEYm5CWm8yNzFtRHo4VHh1bTUxdDZSLzVqWXJPWXUyb1VU?=
 =?utf-8?B?dXUxZVBCY3VoN0NPbWpnU0E2Q2NIaFM2Z2dCZ1g0Z2x2ZTI0SStXeHdzdmw0?=
 =?utf-8?B?eTlYbW5MWXQvZnN4RkFoT0hLQjcyVFQxNkg2T3ZVYlBWYmRZRXgwdU5tRzBU?=
 =?utf-8?B?TWlNRHEzaEQ3QzFvazRLbEY0UG5xSXFrRHNqNUdZaDdVdGptV1NoMkFrOWE0?=
 =?utf-8?B?VHJKN1hvdklQWnQrV2FvczlLK3hQS3pNMmtSOEJZUUY4bnRWUXdBdUx2eDY4?=
 =?utf-8?B?dFVFSzh6MUI4eUV3NGZDV1hzRlN4R28rTFRvSlFMR01waDV5aUc4M093aHJP?=
 =?utf-8?B?M1J4OXU2RHFUZ1FieHJoSnh1QitPYUlJYmwwZlhYUEZYVGNyMXpjWlR1bEVJ?=
 =?utf-8?B?S0MxSEc4NXpHUWNGQ25wQVJTdmpKUUFmNzdwRG9UWVh1RUtKVGl1SUxKUW1K?=
 =?utf-8?B?VGpYNlJNMVIwWCt3TWtNVE5QYkxWYnhVVVZvR2xmNDlPcW5rV3NhWUVlTU4w?=
 =?utf-8?B?VkVGSWJEQ0k1L3U1SHNiTWZLNUFHR3hEWWwvRTJuVDlkbUZmZ2N5dHJsUUpF?=
 =?utf-8?B?VVlJRjkrL3RUbWtKVTQwUlBDOGRyNCtHN1lQRGZJd0FoZis0Mm5XRElXNlNV?=
 =?utf-8?B?ckhEZzAyQkw4cWY4VkIzcy9meHNreHQwSklXZHI2ZGJxNFROWXc0TXh1M2ZC?=
 =?utf-8?B?S28vTEFyZnZnZkh2eGp0NEE0ZmtKTUpEVkt1cDZ6M3dJb3g5OTJTNjJPUFVw?=
 =?utf-8?B?OTBJU0p3c2ZOV3crQVV0R2M4QnJIaWZLOGVmb2xkaUMwcFVJZ0l5QT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666c2ef6-3d63-462b-b144-08deabe266f6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 02:43:21.4039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gjHKFABeRMSCkyg4wza7ec6v7e/50oUbTHobBlDYfAt6HkYl0zEkFSBMER6LhF4L52wbqic1BwB29/DiYNV7AU6SEn6naBr+1VrRCmU52E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_194336_757633_F4B4994E 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stepan,

On 2026/5/7 02:35, Stepan Ionichev wrote:
> aml_spisg_setup_transfer() takes a non-NULL exdesc pointer; the
> function dereferences exdesc unconditionally later in the body to
> populate the SPI scatter-gather descriptors (tx_ccsg / rx_ccsg).
> The sole caller, aml_spisg_transfer_one_message(), always passes a
> valid pointer derived from kcalloc().
> 
> The "if (exdesc)" guard around the memset() at the start of the
> function is therefore dead and misleading -- it suggests callers
> may pass NULL when in fact they may not. smatch flags the
> inconsistency:
> 
>    drivers/spi/spi-amlogic-spisg.c:314 aml_spisg_setup_transfer()
>      error: we previously assumed 'exdesc' could be null (see line 261)
> 
> Drop the check; the unconditional memset matches the unconditional
> dereferences elsewhere in the function and removes the inconsistency
> that smatch reports.
> 
> No functional change.
> 
> Signed-off-by: Stepan Ionichev<sozdayvek@gmail.com>
> ---
>   drivers/spi/spi-amlogic-spisg.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
> index 19c5eba41..b2a916496 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
> @@ -258,8 +258,7 @@ static int aml_spisg_setup_transfer(struct spisg_device *spisg,
>          int ret;
> 
>          memset(desc, 0, sizeof(*desc));
> -       if (exdesc)
> -               memset(exdesc, 0, sizeof(*exdesc));
> +       memset(exdesc, 0, sizeof(*exdesc)); >          aml_spisg_set_speed(spisg, xfer->speed_hz);
>          xfer->effective_speed_hz = spisg->effective_speed_hz;

Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
