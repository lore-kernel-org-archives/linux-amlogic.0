Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCF0C32792
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 14:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D313820815
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 14:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tt249a9D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D313820815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i21KTB69DUiXXyf6jrNgnhT5Vc57CGkOLb2XaoedsCM=; b=Tt249a9DZNChLE
	VDfXWFnQWnW8T4R9+q6x8tjKI6W+FqmEmyplj1je7ZRVR13tYLaKK5CbBEwtk0AP9J/4W0HqoDrM+
	rtJm0ApRuJaHpp1JJbd4JQf2J3lCBK5hwkT4EeygOlH1EQYj/ZzRHzo1QFgMdsSnGwwjHGCkdgEo4
	ry/O5ifUok22kO+GWTG6c+Ar+mUhKeDjAoviCHkacc+r8OzbzmOyCtOUAwMg/7Rs/HeghQw978IPv
	GSHH5QnfQJdV67ZMRhSp/Tn2SGeiUVq8tk9VsEV1zcWCTPsyKaP2DI8HbKX0Lnu2OFlH9dGb8DgHz
	hd3IxlHmcwtQFzbt3Wkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEx2o-0006pX-4H; Mon, 30 Sep 2019 14:52:58 +0000
Received: from mail3-163.sinamail.sina.com.cn ([202.108.3.163])
 by bombadil.infradead.org with smtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEx2j-0006oL-UK
 for linux-amlogic@lists.infradead.org; Mon, 30 Sep 2019 14:52:56 +0000
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
 by sina.com with ESMTP
 id 5D9216B60001C679; Mon, 30 Sep 2019 22:52:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 55875849283243
From: Hillf Danton <hdanton@sina.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm_sched with panfrost crash on T820
Date: Mon, 30 Sep 2019 22:52:28 +0800
Message-Id: <20190930145228.14000-1-hdanton@sina.com>
In-Reply-To: <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_075254_184635_7552BC9C 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
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
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon, 30 Sep 2019 11:17:45 +0200 Neil Armstrong wrote:
> 
> Did a new run from 5.3:
> 
> [   35.971972] Call trace:
> [   35.974391]  drm_sched_increase_karma+0x5c/0xf0
>			ffff000010667f38	FFFF000010667F94
>			drivers/gpu/drm/scheduler/sched_main.c:335
> 
> The crashing line is :
>                                 if (bad->s_fence->scheduled.context ==
>                                     entity->fence_context) {
> 
> Doesn't seem related to guilty job.

Bail out if s_fence is no longer fresh.

--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -333,6 +333,10 @@ void drm_sched_increase_karma(struct drm
 
 			spin_lock(&rq->lock);
 			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
+				if (!smp_load_acquire(&bad->s_fence)) {
+					spin_unlock(&rq->lock);
+					return;
+				}
 				if (bad->s_fence->scheduled.context ==
 				    entity->fence_context) {
 					if (atomic_read(&bad->karma) >
@@ -543,7 +547,7 @@ EXPORT_SYMBOL(drm_sched_job_init);
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
 	dma_fence_put(&job->s_fence->finished);
-	job->s_fence = NULL;
+	smp_store_release(&job->s_fence, 0);
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
--


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
