Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB68CC4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 20:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89AE20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 20:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWbYD7B0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="Zixga9Uh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B89AE20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3rYN61Xlx4OugmBdMVoNIwRyDWiucDXboyqrMg+e80=; b=XWbYD7B0nDLs24
	kh6ViBoyXfTuZz9XtxJ6LTrZa5chY8JmG1c47fI4HF3fnOvyVJ+kOgiN+4kP1rcqVkO2ZxYuo/8+o
	DRlSmOLGwbcFFQP/emUg9D2hX3KnE27MUEng9Tz1luzMWcY9maMqlvTt+vWPESwjKGN1lsZAu6Guf
	c6cXQH25b3A0wl9IIQgeRywvWNb4m8tQ10tr1r6DPzti8H0PeynD9a0alF/pHZzd+a0g1ypuLxYo3
	S0w42Aibz4PdiCTJ/uck/AzprPA9vL6CSJntiJ3w0fXrdrMlyrF85y8yH+0htFfbSmKtMfNoRAWuB
	gjRJoIa7W70BvKhAIZ2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDxHV-0003wk-6T; Fri, 27 Sep 2019 20:56:01 +0000
Received: from mail-eopbgr770088.outbound.protection.outlook.com
 ([40.107.77.88] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDxHT-0003wE-2Z
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 20:56:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P++z8aeo2frWt5N9REo7D7puyHfyQVCi6ElZGjMGGlPuH0QY15U5m/wQFjFx4HtrgPR85l04RtSvDdyfROxGPfb4j/SAayX9FAj24hXwHV5qoXDEEuwJzNxOgYspzouJjPaeZaYx6tF/2RuudnGRXRm2R4m+fLDPXiCHN/+0YjmoxfAiwk/VAQxMuwUVxTodX9CdfJEXezSi+Wj+P6OsHYcGCGL4KutEmAiCAcBtFlddXue9y4dhpX7LtB1mYxwWyPB5m2kWMtGp40hOyJE7usfp5ztxFSma5WLcCssnP0GItIikajQQZek23N9Tl6doAXXq+jspIZoN7OUx0JL4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX7yj9jLUzQcm5DBkaAkxFwoyZkri3auLn7bi0rCrXY=;
 b=TV2f6oBHII9R428ZHiY25ue6Jq+7HcG6/2Ks8E/vmlic/4osxoeFbM2utpR2bLbKv+5saxMhRr+g8e2oqvVsMwevgDMq9VNuh9zQYmVnjUB0rXLN6FeUnVrzRKDHq3Mt0SZc97Nclgr9tvEoxZtYRzhBr5zASVAFHykGikGdMETgAHwXqCFGB3TV+ycLx7gtG6EOrTtMddir1EBIS5RIic7tLE2kNJer571FkR73YTi3nh116ArJEd03Ti5hGR8gajJprFhCHdx3mZHpMezlxr9Q+34+h5urA9GbDc6LT6gy3iyR8G63jjqK/8/HNQdSc15Rrtm/lbkvXPPdom//cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX7yj9jLUzQcm5DBkaAkxFwoyZkri3auLn7bi0rCrXY=;
 b=Zixga9UhFs1Y30lswDwLbPnp85/A50w0EudfyFudkLai17BSlG6Zbas/zhCWUdBrkdudEGgq3JcB9OQYgXEPNJ9wlUNTxVA0XpkBuMyblMREOTxziEisSGkj78yFqxcE1kWjF7wxaJwPwrHMN/5C2gPye9TMHlXES1eM7AUTt2s=
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1693.namprd12.prod.outlook.com (10.172.56.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 27 Sep 2019 20:55:55 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6%10]) with mapi id 15.20.2305.017; Fri, 27 Sep
 2019 20:55:55 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: drm_sched with panfrost crash on T820
Thread-Topic: drm_sched with panfrost crash on T820
Thread-Index: AQHVdQtdjrcnE/APhki/CyOIa6xfH6dAAc4A
Date: Fri, 27 Sep 2019 20:55:55 +0000
Message-ID: <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
In-Reply-To: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0aed735-28c0-4f50-83c5-08d7438d16f8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1693:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB16935EAF24DF9FC3C1CB6D31EA810@MWHPR12MB1693.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(199004)(189003)(51234002)(52314003)(316002)(478600001)(446003)(5660300002)(11346002)(14444005)(256004)(66066001)(2616005)(476003)(6246003)(99286004)(7416002)(229853002)(86362001)(6512007)(7736002)(52116002)(36756003)(8936002)(31686004)(66556008)(66946007)(6506007)(64756008)(54906003)(66476007)(486006)(386003)(66446008)(2201001)(53546011)(110136005)(45080400002)(3846002)(6116002)(6636002)(305945005)(25786009)(26005)(2906002)(14454004)(186003)(4326008)(2501003)(76176011)(71190400001)(71200400001)(6436002)(8676002)(102836004)(31696002)(81156014)(6486002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1693;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sjcSFo5wb8fu2vsivCgc1cI63PoUPWrL1Jc8/qJt2iL1lVzAJs2ixfDfnvwEHI+D35n4Yz3WTz3/Om0OfIbcKN8Dwxf/PtgM5arT9TNc/SVcoWf8ssxVkzkCh7oXWazQML4nOSu4NAOzIk7qYRFoQ9ONL4CTp6xck2LQyAyxOuK4/uXwfEyoIRkzdTudDD7Pf8vPBxQV7q/JqHjZlcU2eGecoQ/k8Ht6heUcVn1BlVofoHGZ/ZF6KcYwgTEr8f22jg86lY+seDrnJKFAJnryHMRBqPaV8jkaLRg4plJwxGLu9n5g5SsGE1JLCZXy9/CB3TGlmUF/Hwvp8WJO9yWvhazPYdw7gFnsEpugJyWcV3M0A6UymJ2Rs1vO29VnT5MeP/uvkhutyDkifV/bxiuRsoi498Qq5adTw3S5yoo7nOk=
Content-ID: <C59B838ADB0BFB40BDF91512DA78EF80@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aed735-28c0-4f50-83c5-08d7438d16f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 20:55:55.4738 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqjwhEx7DkbtNXlFFgp77gueyq6PVBLvyc7QAfdx6qokz3RJXAkdL0h0xcFKLLFvvl0p2q5dgHqqzZWBWYmUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_135559_174924_329CD637 
X-CRM114-Status: GOOD (  17.30  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Can you please use addr2line or gdb to pinpoint where in 
drm_sched_increase_karma you hit the NULL ptr ? It looks like the guilty 
job, but to be sure.

Andrey

On 9/27/19 4:12 AM, Neil Armstrong wrote:
> Hi Christian,
>
> In v5.3, running dEQP triggers the following kernel crash :
>
> [   20.224982] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> [...]
> [   20.291064] Hardware name: Khadas VIM2 (DT)
> [   20.295217] Workqueue: events drm_sched_job_timedout
> [...]
> [   20.304867] pc : drm_sched_increase_karma+0x5c/0xf0
> [   20.309696] lr : drm_sched_increase_karma+0x44/0xf0
> [...]
> [   20.396720] Call trace:
> [   20.399138]  drm_sched_increase_karma+0x5c/0xf0
> [   20.403623]  panfrost_job_timedout+0x12c/0x1e0
> [   20.408021]  drm_sched_job_timedout+0x48/0xa0
> [   20.412336]  process_one_work+0x1e0/0x320
> [   20.416300]  worker_thread+0x40/0x450
> [   20.419924]  kthread+0x124/0x128
> [   20.423116]  ret_from_fork+0x10/0x18
> [   20.426653] Code: f9400001 540001c0 f9400a83 f9402402 (f9401c64)
> [   20.432690] ---[ end trace bd02f890139096a7 ]---
>
> Which never happens, at all, on v5.2.
>
> I did a (very) long (7 days, ~100runs) bisect run using our LAVA lab (thanks tomeu !), but
> bisecting was not easy since the bad commit landed on drm-misc-next after v5.1-rc6, and
> then v5.2-rc1 was backmerged into drm-misc-next at:
> [1] 374ed5429346 Merge drm/drm-next into drm-misc-next
>
> Thus bisecting between [1] ang v5.2-rc1 leads to commit based on v5.2-rc1... where panfrost was
> not enabled in the Khadas VIM2 DT.
>
> Anyway, I managed to identify 3 possibly breaking commits :
> [2] 290764af7e36 drm/sched: Keep s_fence->parent pointer
> [3] 5918045c4ed4 drm/scheduler: rework job destruction
> [4] a5343b8a2ca5 drm/scheduler: Add flag to hint the release of guilty job.
>
> But [1] and [2] doesn't crash the same way :
> [   16.257912] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
> [...]
> [   16.308307] CPU: 4 PID: 80 Comm: kworker/4:1 Not tainted 5.1.0-rc2-01185-g290764af7e36-dirty #378
> [   16.317099] Hardware name: Khadas VIM2 (DT)
> [...])
> [   16.330907] pc : refcount_sub_and_test_checked+0x4/0xb0
> [   16.336078] lr : refcount_dec_and_test_checked+0x14/0x20
> [...]
> [   16.423533] Process kworker/4:1 (pid: 80, stack limit = 0x(____ptrval____))
> [   16.430431] Call trace:
> [   16.432851]  refcount_sub_and_test_checked+0x4/0xb0
> [   16.437681]  drm_sched_job_cleanup+0x24/0x58
> [   16.441908]  panfrost_job_free+0x14/0x28
> [   16.445787]  drm_sched_job_timedout+0x6c/0xa0
> [   16.450102]  process_one_work+0x1e0/0x320
> [   16.454067]  worker_thread+0x40/0x450
> [   16.457690]  kthread+0x124/0x128
> [   16.460882]  ret_from_fork+0x10/0x18
> [   16.464421] Code: 52800000 d65f03c0 d503201f aa0103e3 (b9400021)
> [   16.470456] ---[ end trace 39a67412ee1b64b5 ]---
>
> and [3] fails like on v5.3 (in drm_sched_increase_karma):
> [   33.830080] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
> [...]
> [   33.871946] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [   33.877450] Modules linked in:
> [   33.880474] CPU: 6 PID: 81 Comm: kworker/6:1 Not tainted 5.1.0-rc2-01186-ga5343b8a2ca5-dirty #380
> [   33.889265] Hardware name: Khadas VIM2 (DT)
> [   33.893419] Workqueue: events drm_sched_job_timedout
> [...]
> [   33.903069] pc : drm_sched_increase_karma+0x5c/0xf0
> [   33.907898] lr : drm_sched_increase_karma+0x44/0xf0
> [...]
> [   33.994924] Process kworker/6:1 (pid: 81, stack limit = 0x(____ptrval____))
> [   34.001822] Call trace:
> [   34.004242]  drm_sched_increase_karma+0x5c/0xf0
> [   34.008726]  panfrost_job_timedout+0x12c/0x1e0
> [   34.013122]  drm_sched_job_timedout+0x48/0xa0
> [   34.017438]  process_one_work+0x1e0/0x320
> [   34.021402]  worker_thread+0x40/0x450
> [   34.025026]  kthread+0x124/0x128
> [   34.028218]  ret_from_fork+0x10/0x18
> [   34.031755] Code: f9400001 540001c0 f9400a83 f9402402 (f9401c64)
> [   34.037792] ---[ end trace be3fd6f77f4df267 ]---
>
>
> When I revert [3] on [1], i get the same crash as [2], meaning
> the commit [3] masks the failure [2] introduced.
>
> Do you know how to solve this ?
>
> Thanks,
> Neil
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
