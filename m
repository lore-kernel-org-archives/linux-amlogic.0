Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70740C35280
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 16:53:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401CB21920
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 16:53:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ORMg7qoQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="r8fugI+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 401CB21920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYeLmr44SgyKN8shKChnHPiwffcVHS1X0LO/fLMhWKs=; b=ORMg7qoQjbX5vI
	uoRvWze9Y2633hXWOOv6v+rrqC+sdX4W1LWtaGc5lTimGjOn6PciIy+i8DLTx6TIolSZ6dTySRAvo
	glcYpmwx4AUhKioeE6EAN6O4V8fGlV5dhuzk3dIGCd+fxIbOfGtlKxvuXtF5MSHLOU+FEVioYskjB
	NLo09d8PZPkXkQzC+i2+VXX5dRDMdpM+rMfXhbnStVGXBCr/vXjQu9JnS09OuxvdI3/KTcr+wLYmt
	DCKLTrWUzfMoq33K75oAmCFmeQeHLYjU5UPM+rH699gG5W1FYm8XCiySlhIirwCI+UvE5rcatlaIU
	59mGmFJSrcHbOCCkvK2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFhsO-0000BM-C2; Wed, 02 Oct 2019 16:53:20 +0000
Received: from mail-eopbgr730049.outbound.protection.outlook.com
 ([40.107.73.49] helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFhsK-0000AA-Vv
 for linux-amlogic@lists.infradead.org; Wed, 02 Oct 2019 16:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqEPeLbgs5PsLWveq2G5Lc3ltYlF/IjZRd7zyTJbNBfCglqZha+H0PdQ0OdlysDn4cTJP2npsNUjYiXjGrSFgjhaSR+kseOBSCXebH2G1sHBe6iRWN4ssq2FIkOFM/IOEWFI81QqyIvaFI3fQVBRekwlh+lQsAZdvHfrVxG7lr7BDh2Je+vu70I3SQJozPTxk/+iQIQoE1hUg7/gOn5FT4ChjcT7QW6z+ClbcZGEK33T3XiQTq7wreTYHieJLrcAlAFcdBtZ++WtIy2R5Nbk7sSaFSYcwfP7HxM9eSzjkZ0tlmjuoD6U1KFC8cJTxW205KTG4wyPVby29iPIwMqE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkWZFIUKli+yxaFCWJ5tEkeDEe1zSbC/JY1oNDETO1E=;
 b=og/KCvp5vLpEwlC1YYozv3NmP+sWuXdWQT2FDNY92qI2ZNp/pE9nwWAtBNr2jT4pMnwIs4mznVJ3gBOrieR1CR1XjRkO5fBWU5Bafh7J5GGg7RT/kINLKqTpNAHSI1x5/r0FfWLwdubHXXPoyCFfnkbT0KPU3K2s3nVWTnJRxkZ4F/MTKjgvgQw0u0NrdzOJZ/Ni7djvf5Yg7FqqmaBEZEiysKXAdBFpZmHF8lMQWnTMd+TjaUIWInzhSJ9z1wPWKVdylIVNZ69PHugR4t5NyxAy/Y0h3RTLz+q36yDkue6gbPqFo2Q2oQtVvYV4DKCXQeMtNayaZbztR+l0f71ZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkWZFIUKli+yxaFCWJ5tEkeDEe1zSbC/JY1oNDETO1E=;
 b=r8fugI+PFLPu3zn9YNaFVCIMZODmNIbduQoFus/Gt002KcmUUHSEZRBS95TmB/NIuV0ZFekqQWeiVInjouC7ixjbky/yxJhWuv/ZAE9Ggk0KFbOpnlgB1TQdECFfEsoGeVyOKuc4bA3E1sLpujNrmU+wf/BiNK8jbNX1xwqzGpc=
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1583.namprd12.prod.outlook.com (10.172.56.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 16:53:10 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::4803:438a:eb1d:d6a6%10]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 16:53:10 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: drm_sched with panfrost crash on T820
Thread-Topic: drm_sched with panfrost crash on T820
Thread-Index: AQHVdQtdjrcnE/APhki/CyOIa6xfH6c/vsAAgAQ2/4CAA6PTAA==
Date: Wed, 2 Oct 2019 16:53:10 +0000
Message-ID: <d5ceef14-b876-c102-d793-25289635cab1@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <5f7d10ab-1ce5-25aa-90bd-4f87ed2a9bfb@baylibre.com>
In-Reply-To: <5f7d10ab-1ce5-25aa-90bd-4f87ed2a9bfb@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::15)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2607:fea8:3edf:fe95::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28ade9d2-d561-4873-afa9-08d747590195
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR12MB1583:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1583CBBA8CC4758F51002DC0EA9C0@MWHPR12MB1583.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(52314003)(51234002)(189003)(199004)(5660300002)(46003)(86362001)(99286004)(31686004)(186003)(31696002)(53546011)(6506007)(102836004)(52116002)(14454004)(76176011)(386003)(36756003)(7736002)(110136005)(4326008)(256004)(6636002)(6246003)(2906002)(71200400001)(14444005)(71190400001)(45080400002)(25786009)(316002)(6116002)(2201001)(486006)(478600001)(64756008)(2616005)(446003)(54906003)(7416002)(476003)(66476007)(11346002)(66556008)(305945005)(66446008)(66946007)(81166006)(81156014)(8676002)(8936002)(6486002)(229853002)(2501003)(6512007)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1583;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1//5BZAL3iMRo/2qc6gNwIg9IqBW62i7BtMBMsNL55K83Fg5O2fCBWi11QKmRB222AUfVJyUsB7V6krpq/XTeI89QDXjz26lnqRUmhSL93vK5jJRA7BH9u8gdn5jrjc+O/kRS+/G6HYyuVAwLF/hy7In7RwsRR+IgDoqyuOia1G20mnd+ZFpUcRbsamjYXQvf9BHHUqqBzIXky7pc7OXhLglPjGADoSlNfWP7SbHlxRaB/NNSUkqZwDG987TsNApNpUH5NFrgodggx5koghuX7OSSS4R2eqG2ILXeFl5Tsnjcx+VR06+LWdV+F7O6vcL1LaojM6Z3/FSsEUaLAUgNjnFF4h5lx2c5lRolCpa4PYnn40++zNAEiI+pqf8wGp3KHTifLGUzkNK3FF4aKSdscpF4+drigbmwSUw4i61/h0=
Content-ID: <AAF20E40FC56A446A552B6C34B982D53@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ade9d2-d561-4873-afa9-08d747590195
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 16:53:10.3461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7yWjZB4OQTtC94BIGFWAZTHfZ1l2B8uS6C9+B8Z5ffr2Msh9tYV9DxwjDb2Gsef82FeUXdTW5zg1YdVq/KscQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_095317_092830_B2EEF3DE 
X-CRM114-Status: GOOD (  17.21  )
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


On 9/30/19 5:17 AM, Neil Armstrong wrote:
> Hi Andrey,
>
> On 27/09/2019 22:55, Grodzovsky, Andrey wrote:
>> Can you please use addr2line or gdb to pinpoint where in
>> drm_sched_increase_karma you hit the NULL ptr ? It looks like the guilty
>> job, but to be sure.
> Did a new run from 5.3:
>
> [   35.971972] Call trace:
> [   35.974391]  drm_sched_increase_karma+0x5c/0xf0	ffff000010667f38	FFFF000010667F94	drivers/gpu/drm/scheduler/sched_main.c:335
>
>
> The crashing line is :
>                                  if (bad->s_fence->scheduled.context ==
>                                      entity->fence_context) {
>
> Doesn't seem related to guilty job.
>
> Neil


Thanks Neil, by guilty i meant the 'bad' job. I reviewed the code and 
can't see anything suspicious for now. To help clarify could you please 
provide ftrace log for this ? All the dma_fence and gpu_scheduler traces 
can help. I usually just set them all up in one line using trace-cmd 
utility like this before starting the run. If you have any relevant 
traces in panfrost it aslo can be useful.

sudo trace-cmd start -e dma_fence -e gpu_scheduler

Andrey


>
>> Andrey
>>
>> On 9/27/19 4:12 AM, Neil Armstrong wrote:
>>> Hi Christian,
>>>
>>> In v5.3, running dEQP triggers the following kernel crash :
>>>
>>> [   20.224982] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
>>> [...]
>>> [   20.291064] Hardware name: Khadas VIM2 (DT)
>>> [   20.295217] Workqueue: events drm_sched_job_timedout
>>> [...]
>>> [   20.304867] pc : drm_sched_increase_karma+0x5c/0xf0
>>> [   20.309696] lr : drm_sched_increase_karma+0x44/0xf0
>>> [...]
>>> [   20.396720] Call trace:
>>> [   20.399138]  drm_sched_increase_karma+0x5c/0xf0
>>> [   20.403623]  panfrost_job_timedout+0x12c/0x1e0
>>> [   20.408021]  drm_sched_job_timedout+0x48/0xa0
>>> [   20.412336]  process_one_work+0x1e0/0x320
>>> [   20.416300]  worker_thread+0x40/0x450
>>> [   20.419924]  kthread+0x124/0x128
>>> [   20.423116]  ret_from_fork+0x10/0x18
>>> [   20.426653] Code: f9400001 540001c0 f9400a83 f9402402 (f9401c64)
>>> [   20.432690] ---[ end trace bd02f890139096a7 ]---
>>>
>>> Which never happens, at all, on v5.2.
>>>
>>> I did a (very) long (7 days, ~100runs) bisect run using our LAVA lab (thanks tomeu !), but
>>> bisecting was not easy since the bad commit landed on drm-misc-next after v5.1-rc6, and
>>> then v5.2-rc1 was backmerged into drm-misc-next at:
>>> [1] 374ed5429346 Merge drm/drm-next into drm-misc-next
>>>
>>> Thus bisecting between [1] ang v5.2-rc1 leads to commit based on v5.2-rc1... where panfrost was
>>> not enabled in the Khadas VIM2 DT.
>>>
>>> Anyway, I managed to identify 3 possibly breaking commits :
>>> [2] 290764af7e36 drm/sched: Keep s_fence->parent pointer
>>> [3] 5918045c4ed4 drm/scheduler: rework job destruction
>>> [4] a5343b8a2ca5 drm/scheduler: Add flag to hint the release of guilty job.
>>>
>>> But [1] and [2] doesn't crash the same way :
>>> [   16.257912] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000060
>>> [...]
>>> [   16.308307] CPU: 4 PID: 80 Comm: kworker/4:1 Not tainted 5.1.0-rc2-01185-g290764af7e36-dirty #378
>>> [   16.317099] Hardware name: Khadas VIM2 (DT)
>>> [...])
>>> [   16.330907] pc : refcount_sub_and_test_checked+0x4/0xb0
>>> [   16.336078] lr : refcount_dec_and_test_checked+0x14/0x20
>>> [...]
>>> [   16.423533] Process kworker/4:1 (pid: 80, stack limit = 0x(____ptrval____))
>>> [   16.430431] Call trace:
>>> [   16.432851]  refcount_sub_and_test_checked+0x4/0xb0
>>> [   16.437681]  drm_sched_job_cleanup+0x24/0x58
>>> [   16.441908]  panfrost_job_free+0x14/0x28
>>> [   16.445787]  drm_sched_job_timedout+0x6c/0xa0
>>> [   16.450102]  process_one_work+0x1e0/0x320
>>> [   16.454067]  worker_thread+0x40/0x450
>>> [   16.457690]  kthread+0x124/0x128
>>> [   16.460882]  ret_from_fork+0x10/0x18
>>> [   16.464421] Code: 52800000 d65f03c0 d503201f aa0103e3 (b9400021)
>>> [   16.470456] ---[ end trace 39a67412ee1b64b5 ]---
>>>
>>> and [3] fails like on v5.3 (in drm_sched_increase_karma):
>>> [   33.830080] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
>>> [...]
>>> [   33.871946] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>>> [   33.877450] Modules linked in:
>>> [   33.880474] CPU: 6 PID: 81 Comm: kworker/6:1 Not tainted 5.1.0-rc2-01186-ga5343b8a2ca5-dirty #380
>>> [   33.889265] Hardware name: Khadas VIM2 (DT)
>>> [   33.893419] Workqueue: events drm_sched_job_timedout
>>> [...]
>>> [   33.903069] pc : drm_sched_increase_karma+0x5c/0xf0
>>> [   33.907898] lr : drm_sched_increase_karma+0x44/0xf0
>>> [...]
>>> [   33.994924] Process kworker/6:1 (pid: 81, stack limit = 0x(____ptrval____))
>>> [   34.001822] Call trace:
>>> [   34.004242]  drm_sched_increase_karma+0x5c/0xf0
>>> [   34.008726]  panfrost_job_timedout+0x12c/0x1e0
>>> [   34.013122]  drm_sched_job_timedout+0x48/0xa0
>>> [   34.017438]  process_one_work+0x1e0/0x320
>>> [   34.021402]  worker_thread+0x40/0x450
>>> [   34.025026]  kthread+0x124/0x128
>>> [   34.028218]  ret_from_fork+0x10/0x18
>>> [   34.031755] Code: f9400001 540001c0 f9400a83 f9402402 (f9401c64)
>>> [   34.037792] ---[ end trace be3fd6f77f4df267 ]---
>>>
>>>
>>> When I revert [3] on [1], i get the same crash as [2], meaning
>>> the commit [3] masks the failure [2] introduced.
>>>
>>> Do you know how to solve this ?
>>>
>>> Thanks,
>>> Neil
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
