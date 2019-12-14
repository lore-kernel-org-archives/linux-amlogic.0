Return-Path: <SRS0=KqFA=2E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C468C2D0CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Dec 2019 17:58:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B45F20724
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Dec 2019 17:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2KIgqyI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv/VdsoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B45F20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UHJCHpYfxd0JxuPSCb3/LKDkPVhkTq2jStHuLoIGSZY=; b=d2KIgqyIaH/+BfrUC0Isb6X1dQ
	Nap9U9a7A0mjMB2prh4Zv4m9mFVsb5HiGaLiuZRrl86aI3TJhGZAbqZBznEHLs6d6es9m1AtxeSAE
	P478kPZtn0JDMgLroHaKwGh8suxr3hcySmyfoEm/MqlfGbZaovQUZU3y+BGuvskOUpJjS6gBxt9wj
	E3yjti7MM4RnFzFYbq5NsB7AICRGHV6iD0du+im+iXaVutgyu99d+xGkNUJWkCuwMCXSXkcyXoBMf
	LS1Hdj1nJ7rFHHbfRv4HCG9K5rQp/YVI9vmiI4uhNaC6zusXyYTMupcHUCcumTw7IOJzm1KyN/1Sq
	vnPeTq+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBfu-0007B2-EE; Sat, 14 Dec 2019 17:57:54 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBdJ-0004NZ-IU; Sat, 14 Dec 2019 17:55:15 +0000
Received: by mail-pf1-x442.google.com with SMTP id y14so3227000pfm.13;
 Sat, 14 Dec 2019 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nt2pN2PNTd9g1AzNbzq97oeN58SK9gcKW9K3SpO8TF4=;
 b=Gv/VdsoRgHpB/c2yhY2FchQl8GlLj2LlyDV4SziV3wj7136aNHsMcLqaDjKfQbUYQ5
 Ldl81jRSZL58cvErn85BIIYXKzfWUj5bfw5iobZJgqKqqmNhqRE1ByUn0dqGpOHr+Rnw
 wuD3z+aSoLOmJQIgJTqLwfsPq9y1aaDENwT5ZKsDlK9a6T6/kGECY9UfcDScfSdw6M7c
 U0z6d7KxleQpb4fK+hl28q/5ksU/irT2Sm/TwLTtz3ifQDnwg8gLJbGCbseQbmcblxt2
 BYYdY6ud2OupWCJBTlY96/jwPXSOxJkm5e3elKHdaVSnBwj+rxXpCv7ev/+hyx4Lko4b
 e+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nt2pN2PNTd9g1AzNbzq97oeN58SK9gcKW9K3SpO8TF4=;
 b=GAUnOAZuU2pDu3rswW0VrzrlObvzOmXbnwbL2hKOwVBDv4heFufV2xrevJxCRhbbNW
 ItaBzrcNEeX88eSFW+UT0y4O7F9iCViulUSvsikedTsZ+Als0QXXAQD6xvupMEmPD2/7
 liZi20XGKM479eXQQaXydGePbBfTdOD4v+eW2h4xzDPrdHRKkelCPEVVx6Jagoe9HHPo
 Tck3IvaHWRY4R8rGSyFpxS2IBXc9CV64X8a+sh2eS5cZqzj270iyP9coPNhJbMb6QMjx
 143EN3p1PlItbWp6+Y++Y6Llw7suqfy+xCH+LuxHpq1fZzvxZIyy5ag3Gk6Er9hu+R+5
 rYUQ==
X-Gm-Message-State: APjAAAXYtzVjWLTbbEv1C5R8cXA2XOnxisMHDD2vmdUFrTfRs+JJN+qo
 8rCAkyQXfhdcs1yay4u2lG4=
X-Google-Smtp-Source: APXvYqybjjn/TOWlA2h31OJeNnxlYt/SPwXnKosPeewYaqCCBb4gKJUgt8Nd9pDHs/jf79O1lcti/g==
X-Received: by 2002:aa7:848c:: with SMTP id u12mr6216069pfn.12.1576346111060; 
 Sat, 14 Dec 2019 09:55:11 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id p5sm15841692pga.69.2019.12.14.09.55.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:10 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 07/10] soc: ti: wkup_m3_ipc: convert to
 devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:44 +0000
Message-Id: <20191214175447.25482-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095513_660041_2041067F 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 378369d9364a..e058f67e6333 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -429,7 +429,6 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	int irq, ret;
 	phandle rproc_phandle;
 	struct rproc *m3_rproc;
-	struct resource *res;
 	struct task_struct *task;
 	struct wkup_m3_ipc *m3_ipc;
 
@@ -437,8 +436,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	if (!m3_ipc)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	m3_ipc->ipc_mem_base = devm_ioremap_resource(dev, res);
+	m3_ipc->ipc_mem_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(m3_ipc->ipc_mem_base)) {
 		dev_err(dev, "could not ioremap ipc_mem\n");
 		return PTR_ERR(m3_ipc->ipc_mem_base);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
