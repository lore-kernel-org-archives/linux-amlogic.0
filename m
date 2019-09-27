Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CABC4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 09:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EF62146E
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 09:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7A/LEp7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67EF62146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ui5u3Mn2vJuqMR8pfVCsPmC85vBE+x9Sbaul5PW1d8=; b=p7A/LEp7uElrcC
	M3/94u6GtvBE6CsDlg4vK49Wv1vwmVVpVnEKlDGpRS2XGxHLfNBOfDNCOuU2Bi8xkexH+ziEPozkc
	MuI1Uymnh+/i5J7UuL/bH5xIpncdmBokeev75Vu9Z+FB72ZNg4r76l5XdfuLbRlj3W6Yge1ohcVDV
	jYuB7By2f1jhbQUWmresNzErNd7qUaa9T2RpQJ34pxkQ31c32CUZgrWtUIW4ZLGVjd0M2GRqfthmu
	UsY24gqPHQSfzhl75GD6TBGA/ii11QMeCaFDf7m5XgXJckjWETpiqAPOMfxUr+iAuLj5HU2NrSaTP
	DoprUAMCEUo2Jt8W4sug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDmyT-00054O-Jt; Fri, 27 Sep 2019 09:55:41 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDmyR-00053K-4Y
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 09:55:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DCB28;
 Fri, 27 Sep 2019 02:55:36 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C1353F534;
 Fri, 27 Sep 2019 02:55:34 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
Subject: Re: drm_sched with panfrost crash on T820
To: Neil Armstrong <narmstrong@baylibre.com>, daniel@ffwll.ch,
 airlied@linux.ie, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
Message-ID: <3fb178d8-f069-0ae2-1ed3-4ded84a71951@arm.com>
Date: Fri, 27 Sep 2019 10:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_025539_266310_19EF39B4 
X-CRM114-Status: GOOD (  19.90  )
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/09/2019 09:12, Neil Armstrong wrote:
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

My suspicion is that this is really a bug in Panfrost than the scheduler.

I can see the following sequence:

1. Jobs submitted to *both* slot 0 and slot 1 on the hardware.

2. Hardware 'hangs' (most likely an unhandled page fault)

3. The reset timeouts occur. Because Panfrost uses a separate scheduler
for each slot this means we have two threads racing to kill the
respective jobs.

4. Each thread calls drm_sched_job_timedout which calls
panfrost_job_timedout().

5. Both threads calling panfrost_job_timedout() execute:

	for (i = 0; i < NUM_JOB_SLOTS; i++)
		drm_sched_stop(&pfdev->js->queue[i].sched, sched_job);

6. drm_sched_stop() will free the job from the other scheduler. So both
jobs get freed (and sched->free_guilty is set).

7. Depending on the exact race either drm_sched_increase_karma()
dereferences the freed job, or drm_sched_job_timedout() attempts to
double-free the job (because free_guilty is set).

Now there is a lock (pfdev->reset_lock) held during steps 5-6, but the
problem is that the job which has timed out can be freed by the other
scheduler's timeout before/after that critical section.

One obvious issue with the DRM scheduler is that there is a call to
cancel_delayed_work() in drm_sched_stop() which to me looks like it
should be cancel_delayed_work_sync() to ensure that the timeout handling
has completed.

However in the above scenario a _sync() variety would then cause a
deadlock (one thread has pfdev->reset_lock and is waiting for the other
thread which is trying to take the lock).

So we need to update Panfrost so that it can coordinate the reset
between schedulers. Can you try something like the following (untested):

----8<---
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index f503c566e99f..6441c7fba6c4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -99,6 +99,8 @@ struct panfrost_device {
 		unsigned long cur_volt;
 		struct panfrost_devfreq_slot slot[NUM_JOB_SLOTS];
 	} devfreq;
+
+	bool is_resetting;
 };
 
 struct panfrost_mmu {
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 05c85f45a0de..8b935680c066 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -388,6 +388,10 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 
 	mutex_lock(&pfdev->reset_lock);
 
+	if (pfdev->is_resetting)
+		goto out;
+	pfdev->is_resetting = true;
+
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
 		drm_sched_stop(&pfdev->js->queue[i].sched, sched_job);
 
@@ -406,6 +410,8 @@ static void panfrost_job_timedout(struct drm_sched_job *sched_job)
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
 		drm_sched_start(&pfdev->js->queue[i].sched, true);
 
+	pfdev->is_resetting = false;
+out:
 	mutex_unlock(&pfdev->reset_lock);
 }
 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
