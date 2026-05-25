Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A9ACD5BBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3LbIvvXWT2KoRnc3tUy2JSp31e7SR85i/u4K+mVaW00=; b=4nsjh6ShOr3BDo
	Zo8UyV5ZB98UsB2oIOqqZ+ba9W6bV830Qi11pNeHNPZgcn+K7JPq9lZGoMKrEoKveqIqRCmH62YUp
	GTXvy4e0tlysEXaFm84M8lI/xtDkXkVSD7tJngeF+28xiD0HxUIAr1HJF1x+ByF8ircJ6SbLsqkFu
	KM0TuKN78/yOV0ZK85GYrcxesGFwfv1R0/ol3rYQwrgh0jyx+R029LnC7qwfbslzDdINB46A0Gxny
	x/59kR9/HgMSYoAo+2srZjlbjnwqQALCGjlk5Ay5ZSWs2RkUoKswh84ud1GwomwlPfgxFXmpKxxfs
	9HohuhhzTsgWabFzmkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRz8-0000000GsCR-1KqQ;
	Mon, 25 May 2026 09:52:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRz6-0000000GsBZ-2w2a
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 09:52:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba0714574fso51119005ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702751; x=1780307551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=JICKPqQLsnmhDi9eJl4j6hVkasSWvV5iaddg/iKQSd1EuwCKnJ5RChLmTHgdbTvlDY
         GyCRWcxzKyN5fjkuJ6x1pqVgSMbsBj7ZGzyZmIfxZ97ysL51JZ2zvoh5+i0dhL9oYgrC
         CCQcBMRlSBYMWIgwRks5Xl3uWDLvwFwUwQwWPyOzR/jWzqtH/tkXsbDteqTXsc5g3VqJ
         VuvJ9C7yaUF9fj8iznDDTvCgxCztzhSGK9L2qFe9utx0lUCC7fmu9vvockHgk+4Cc+Ff
         ddLH63Cv9vvErUeLKzvAralRgVMYAJbgF69dMBQ9TwpD63TqgMNO6X92aLP3L8kuefgS
         FtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702751; x=1780307551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jqLwhkLz3GnNiG5F6aqvc2zAsvy9RUUFv6VMz3rWAI=;
        b=aZUnLLSYcasgVon3LpDZHqfjQ79p5ta1Z/PI7WazQzpj01HAGuqiVkYfVifJorjq3r
         u4T8vY15KN1G1XGG9aafF/ZYjx7ckVkZRWrtmO+17frjm2C44HflVSKcB+tF1e2wiqsr
         AC/PHiIrKgdnkD7b1yI2wahQ2nH2mZlxfHc92n6JpX0GCyVWMCGXYIYv3BG4J5yXnxgq
         C/6qgW+LWqx8aLqSCxrm8NQNdhXLEE5DNXp6RZY4jAcH9IJUdkqlV0PGt/ogCwPgexxz
         tbpyQpz4cJ6/4j/oqSlMc6BIduhf9Jz1Ky+MgRte6RtJ5VP1qXTSMe4zSlz67NTBB2MX
         x1/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9JCmPP/eBDwEIU/pyk2fBM2QbxOofe7IUpczptG7uSqhr2TMlH/qNHg4ecV9f8/8k9ztpD2O8HVhfqkm6d@lists.infradead.org
X-Gm-Message-State: AOJu0YzBiRIFLRwHvpHrsR8DuHUKGAulyzF9bF9+yWwWqJCMvli0XYLe
	JU8v+7KMBtpEYGWtXYfE3LIXCDrqE++y0Nbj8YyAQh/Bv+Yjdg8oMSdf
X-Gm-Gg: Acq92OF9ilx8umuEPJFAzEPpT4JvDdjFLb/uda6sj6XjA5udP8Eccx0UXc5pW767B5N
	2ymOgDbVW4nuJLRDEIhTFH9K3nuy+/Cg606Avr5/50Ws+LXVJXhEijSPICplPojuJC8gxA5Wtqq
	Ev18PXM9YErzbf8cPUQheHy4MzBc9/QW8fREFKp8o6R6H6+UgzmQhW2ZbPv2GuDEMsxHmTHON6u
	ERNPhTAD+RVYZ7fPCdAHz7R/kqjaiHlFjvbd4CHhKrgCNblTd8HuOXYblwfqMTnoJ/f1jVNi+sF
	pA0JlGg9MyEc9vrfeIjRcWuTNoQjLT0tOwjZ3rUqzbfriPFJhIf4wc3oj9vtdDDmi0JBc/B10CQ
	i42sfVj56OSAbWoa/TCPYFf9hql+kmcshRe4Z0AVRTNP3tz35zT/L2bdxwxjfrhmiBR1e0Vmb71
	F9+fvfdx7CBtpeOn0vf/Kj
X-Received: by 2002:a17:902:ffcf:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2beb0385f3amr153090915ad.13.1779702751312;
        Mon, 25 May 2026 02:52:31 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:30 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 0/6] media: meson: Fix memory leak in error path in vdec
Date: Mon, 25 May 2026 15:21:48 +0530
Message-ID: <20260525095216.12078-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025232_739790_5B8B94FA 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

V5: Changes 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks 
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check, 
  leading to simultaneous hardware programming.
--

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/

V4: Changes:

Following chamges try to fix the memory leak reported by Sashiko

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (6):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Protect session exclusivity check with lock
  media: meson: vdec: Set cur_sess before hardware vdec_poweron()
  media: meson: vdec: Handle kthread error and free codec private data
  media: meson: vdec: Isolate error path buffer flush to the active
    queue
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 54 ++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 10 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
