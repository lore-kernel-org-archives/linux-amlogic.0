Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6846C4167B
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Dec 2022 02:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rjHK1c8HKOCxk0AAj+5PNfLeihuaz9bJTnFHkap9+o=; b=KuiQv9EZZ+Vofx
	BebOBAUoGMEK2vGFHA9dN35cTM8uDevMwP1O1I75XllU1ZyZv7uwvY5nT5xFkZ8axo2NTouYU8kMo
	gp/CmmfQ45SqIrOtcYnlZvjZBBwbxr/1chIkoWdrnm2AvELhul2LKy+bGYa8j5joA8O7SOH7lo5U5
	FFTZ0k5vgFdzdt2erg7KZ7XuzZhFWRXzOWJvtH4y3NLuuBib4tkjtc46JmnmA9jBrdPz+u7jG+otu
	bKzaj6EigMGSIKN5OJTf35OqXsG51BJ1pbS+HGCLQ13Au/kjPlEmMBy5QTBFRdCNPbZdujdoF2Gsl
	fYYc9PB6BSHhDnwHTjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6iz4-00EnFX-7f; Sun, 18 Dec 2022 02:00:58 +0000
Received: from mail-tycjpn01olkn2078.outbound.protection.outlook.com ([40.92.99.78] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6iz2-00EnF3-C1
	for linux-amlogic@lists.infradead.org; Sun, 18 Dec 2022 02:00:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpnqMQR9fCN+R3/s4dFWDQ/wAOLY0i8h7cCQWSixqeeN+YarSRaWt0EVYrkGTIKa8CizD4kddLRnRazNeUkddf9d1uFBocbektX3mp5VC+WDR8mmWuat/9kgTusqELwdr31OkSreKiyBcwNADiKXAn8WyWlTDBuOLwRoC3aONXWn5uqFpERnThO1m2spGsoRl7EMit7Z2TFezdW4I/Idos3tNxqQ+V6czuhE8eCulVhgtDXaGafQLooNmTktMUMNutv15G4Du9c2mbR7fm0lrgIhNiGuuuN7Jf2bRAS8Mrl5DbnrY963sumklwMyiL/ugf5s7l0M+EhTeQXzcHa/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvxFjIvBgAL8FJ3o2BN36y/d5zrDsMjvFrDU5dLOMBg=;
 b=btRGMFsDSd3CGkiROizyiE6ajGmBI/4/ehS7dySQNwttR9BpmwO0V24Tlw0BaCs7zHHQK5pQDc02eyQS6L6H4H3tmzKmXZ64ADMHKU7wgwVXigmuetfQp+75hfACIxpzntUPfxkdO84mVFor8PKjNPV+ZH2zKABUodEJrvpwCMMaVZdCgMDzyXgZCZ4sADg5ZvjyK0FwHwKJURllHdaFUuc38f95PLL7G83lkj7AjImsxA4YJmMe1Bj6+KDmUGjRwDiz2QS0HqdBUJv0Dc5YAaBkwZPvjfhh6gt1RLSF6/YDtn09jsLBMvzPpULlYe4TFWt6JqGHC+JWIU9rfls5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvxFjIvBgAL8FJ3o2BN36y/d5zrDsMjvFrDU5dLOMBg=;
 b=RGZzLpOLlSsSxwLGoRJ+DI/aSJcZ413Znjnfuz1OEnD4SxOuStknkl0DN/fSpQA3BDZu0zIB5ifLJXPuRbpFFRdu799Z2waKWEgunTPNnptEJkzlRqPPw9heqLXmHTM+lpSzlEmdfcsomhJ6MEJlkZxjp5lsEOHlLnASgMeHDoi5lDBhquwHonccpQo0vSlmdem/8k4y1nhaa4aYVgM1CD1vZh36V109zpetNmajw3XYK27GYX+vkSeE3LW5xA1SmB8KSXBj43EvsPIdmQ0Ug06LNq/ayIBHZb2hIpr1wsnXyjlrzXehm6ylrZWA72F5wpunF+mt/a+SMLu+k23nyw==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TYCP286MB1588.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:185::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.14; Sun, 18 Dec
 2022 02:00:51 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5924.016; Sun, 18 Dec 2022
 02:00:52 +0000
Date: Sun, 18 Dec 2022 10:00:46 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: linux-amlogic@lists.infradead.org
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB0641A92D4B6894D30C30C457CDE49@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [ajcs1slQbfRqMCCZPBeIEsBrTOdhxHnRiAzDHVeT3NN8wbDDb2tTpEgu5hnzUGUw]
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y550TvaO9/i+p5on@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|TYCP286MB1588:EE_
X-MS-Office365-Filtering-Correlation-Id: ff66907e-742c-458c-4e05-08dae09bb088
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8h5Ow0zxXKHVEO03sMJbP1p7XhIcnIUu4CFpOmYQTIyBfn5t3ZztoSebtfySH7e8aLQzGORcp50gkVIMJqrjTyreA/SBIcANcvE6Xu30shZ5zc53I3AjlIFMMNdYcvIBLDVeGB1ZwSagaFlydjxKSqV4APj7qO6KXem8urD8U/TFkO57xdH2WxT2ut9cEb8UKHKXyUvOEyJba2xFgvSIYAkGQY2Bhaj2aNmqzlu/l9Zmn7MQOFSyW5mUjPVWLEy1rTHzkc4OMRKHAjuHeGUds6iqEnBLKb2rWjTyCkWgILcgT9GAq3sJQ7zcYergsYn05CcIyejcShffoX1DpYFdfdOMT1qFJEY3eQbtjg8hmMqMsb32YwTCwtMdQOZKSyjjbkYSgCp7RE7Y5CA3KSJS7HxH3vDYP/A3dzIdNeI3j3gIJhmmHYQ6EckqskemSjR3VWufbRAnMI00g9mnO1QUyvWWLOcI4ODKjOcLCiVnw0Fw3Dnlm2pnmHbciIxOl0nIpcuyzQq1GrAkZYMQzWbuo37Kz0G1Dqz46uLoH7t1m7JxU6ei34l7FfhFpeonBDSzldCDP3sx10zaEv37oTiGSRJ2F1z4NhdKiVvdhALMUpaotdLu0L68V6SSpMi3L2JIP35dHRBiIP9OAnhbWUNZ9w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eWtBQUpWRkpMZU1mY1ZYVE5GSmlGYjdOQStoNjBrd0JsRkVvV3JwVExuaWJY?=
 =?utf-8?B?WFJTaytRcC9xdk85d1hLcnAyemJsOUMrMWdhZFJXdit3Yy9UVnA0bWNsL2hq?=
 =?utf-8?B?VXBQMG9qNXoyeGFuSG5CZjVOajIrOWVOZGdtV1JuM2g3TkdJeUdtQTgvbU01?=
 =?utf-8?B?M0M4ejh6dXk4VlQ3bjNxazEvQ1pZREh0aWI2SnN3MWU4V3VldnVwaktla0E1?=
 =?utf-8?B?dHdmZGRCQ3E5TmdQQUJrTitIeEF2TTArSWxscG9pM3YwVGpGenlmejBydzNM?=
 =?utf-8?B?ZEduR2dnUmVsaDFQMkJXNk9HMVBSVTN6MWVoQnZkR1NoSFpNcFhacy92RDc5?=
 =?utf-8?B?MVFEaytJeEFpSjlHNThjeDlyaHZEdW4vYzlLWmJRR1gzbmxLNFhjK1FkUEVs?=
 =?utf-8?B?SXl6SVRMRllMeTlFOFZjWGdLRW5jY0t1OHlHZW5MV1R5L0xhRTNkVzE5bHJD?=
 =?utf-8?B?UkMyalM3RlhvV1ZNNU5oOUNFU285SitjeUZUV0ZrR08vaUtnaEo5WkJLblQr?=
 =?utf-8?B?ZEFxZHcvWXlNdzE2SHZjbmRtdzdxMldTWkNjd2pwVW0rRTl4dkEwZGJhU3pC?=
 =?utf-8?B?a2xQUXRLclZtR2pBSlcrSkNYaUlzZGlkcE1oYVRjaE5BNUlEQzBNWnhpalVz?=
 =?utf-8?B?S1hUNVFzMmNZWWRZSzZLTS9QSHh3dHNPWjNXMXYvWW9Xc3pRL2dJQ0YvZFhm?=
 =?utf-8?B?blcyWG82YmZoME5HWWN4RHc2bGVXT1ZYeGlGQmh3cDFKS2w2Slpvdjhha0Nu?=
 =?utf-8?B?MzN2M3ZDWUowNXczeTdZalppdWRhcFdna3NFQWlXeVp3SmlqQm5oUnJLdWhq?=
 =?utf-8?B?YWNISWl5c0d4MysySE9kMlpjSU1Lb0xPbUEzZGVyRHp6MjUzWTg3alZ1TnAx?=
 =?utf-8?B?aU4zZXJmNHBuRVFqZVIzS1JVNmdBTTNyL1VhL1J1aSttQ3Y5ZEZPNW9ENEUx?=
 =?utf-8?B?cXVBZUNlQ2N2TmRJSFVnUW9wMTNmQXlSSnZ5cVpuU2VDMTJjaTVqMW91YlZp?=
 =?utf-8?B?SjBYelpQakd5OFpHb1JBSDRCQy9DOFFDdDhHdHhGMjMzdFdaQXZRM1lVZ3pJ?=
 =?utf-8?B?WXZnMjNQVFR1M3YrKzRBSlpXN3V6UTFKdjhjeFdoRDQ2b095SzA2c0pxbmQw?=
 =?utf-8?B?bUJhdzc3cm5hUUZMejYyeWxDRHBMbWJaSzJ6eTEvNEN2dXBYWG5RWHEzRDNi?=
 =?utf-8?B?SWtveWFwTmlOeGJMM1UydmVVMkN2cllkY2hTckp3ZEs1T0R3NThHN0I2WUZK?=
 =?utf-8?B?bTdyMHdiRnE5REFwRVh4NHZFWTNxNklSbENNZ3NQY1BoMW9Id2pqQnl5UWtW?=
 =?utf-8?B?amZIMDVqWnZwcmdZU0x6OThoWmdVU2p2czlhMlJyRzAzNFg0QTFxQTJGUllH?=
 =?utf-8?B?U3lweEJkK0lCeDEvZENvNU92MjhtOTdpSmVDU2JPOXo2R0VNeWpiZU1vRTgr?=
 =?utf-8?B?bEp0SU52MENkZ2M2Y1Vaa2dDSWVTZG44bTQ5Ly8rTW5lQ0pJNjVUbFREYVRH?=
 =?utf-8?B?dDR4N2ZDdmdKVHFETXdwSHpGSmpSR0g4L3k1TXlKWGNvc0JlM2Y3SG9NSFlu?=
 =?utf-8?B?RDBOTUEwUytqZDdlNHJJMUpwNCs5Y0sxL1llOTg4ZkxBTjFZM0dPZXRYYjJw?=
 =?utf-8?B?YllRMlVBdzJVa2RDZ1BIUkZOMFQxQTJDVi9zdll2K0FIeVBCYnBINjFsbDFP?=
 =?utf-8?B?Z1JmejZLU3dZNDJFZzVXSUdSK1NITzFNNU1QZ29IRURQWGlOWlpvVWxwa3hK?=
 =?utf-8?B?ajlDb1MwMEdmL21BRThKdFp2Nzd2MG1PK081bmxxNCtHRTc3R0pTUk9FWmFj?=
 =?utf-8?B?NWNXTFk3RnpXQXhUb1dqdz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff66907e-742c-458c-4e05-08dae09bb088
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2022 02:00:52.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221217_180056_460093_22FD9545 
X-CRM114-Status: UNSURE (   5.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

My VIM3 also meet same problem.


On Thu, Dec 08, 2022 at 09:02:00PM +0800, Zhang Ning wrote:
> Hi,
> 
> After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
> below log:
> 
> [  363.591315] INFO: task kworker/0:2:157 blocked for more than 120 seconds.
> [  363.598130]       Tainted: G         C         6.1.0-0-arm64 #1 Debian 6.1~rc7-2~exp1
> [  363.605870] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  363.613682] task:kworker/0:2     state:D stack:0     pid:157   ppid:2      flags:0x00000008
> [  363.621938] Workqueue: events sdio_irq_work
> [  363.625989] Call trace:
> [  363.628294]  __switch_to+0xe4/0x160
> [  363.631812]  __schedule+0x340/0x970
> [  363.635300]  schedule+0x58/0xf0
> [  363.638351]  __mmc_claim_host+0x104/0x290
> [  363.642371]  sdio_irq_work+0x2c/0x90
> [  363.645861]  process_one_work+0x1f4/0x460
> [  363.649879]  worker_thread+0x188/0x4d0
> [  363.653547]  kthread+0xe0/0xe4
> [  363.656523]  ret_from_fork+0x10/0x20
> [  363.661253] INFO: task ksdioirqd/mmc2:408 blocked for more than 121 seconds.
> [  363.668216]       Tainted: G         C         6.1.0-0-arm64 #1 Debian 6.1~rc7-2~exp1
> [  363.674977] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  363.682750] task:ksdioirqd/mmc2  state:D stack:0     pid:408   ppid:2      flags:0x00000008
> [  363.690961] Call trace:
> [  363.693272]  __switch_to+0xe4/0x160
> [  363.696715]  __schedule+0x340/0x970
> [  363.700154]  schedule+0x58/0xf0
> [  363.703285]  __mmc_claim_host+0x104/0x290
> [  363.707243]  sdio_irq_thread+0x84/0x204
> [  363.711000]  kthread+0xe0/0xe4
> [  363.714056]  ret_from_fork+0x10/0x20
> 
> I searched linux-wireless and linux-amlogic maillist no similar issue
> reported.
> 
> I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
> to VIM1's kernel 6.1.0-rc7, is it related?
> 
> thanks.
> Ning.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
