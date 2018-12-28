Return-Path: <SRS0=7NJC=PF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E07C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 967D020855
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ao6SFSNQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Gk6CQ2pi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 967D020855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hWu5bExfyFJwe8Txcjzei5rwu8ZFOxBLcZDhuCFIlOw=; b=Ao6SFSNQvV6LWZXk3tyhCJbk5Y
	5ASyt0UJx/6QVsfzYNRbg9oH2/BP5hul/YizjovjpHYubUUelxzaL+fGn2qp0Kdpz023ysailVb4q
	5wfk3hWPVwF+0VGn2rylsfruJZaaEoCpupTZ5ZqKDho5std78Z5MteE2i8sW8rJfbsLtE65JNstVq
	O1O/uXXsgF1STIdpUXZksOM7EBafk2ddqaRtcbHHIyOJJ/9C5ERnSnjiX9G4skYkF0cXMIMC9skrJ
	nSSkSvcvPQllRPtm2maC61idygmmeMtb3rLXehExcE61VV3/U0ioCFJueygEXlpC8G8dw1cUQs8AO
	0RUd3S1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcpjv-00021O-A4; Fri, 28 Dec 2018 10:51:39 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcpjs-0001t6-0B
 for linux-amlogic@lists.infradead.org; Fri, 28 Dec 2018 10:51:37 +0000
Received: by mail-ed1-x543.google.com with SMTP id y20so17223412edw.9
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Dec 2018 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=839efX+7U5vYxejZ5MhRw75xUHfEI8ipzY9hkahVUzw=;
 b=Gk6CQ2pikAs8wt4C2vOgxBoJjANTeMK10dypoh/+0xvczPRvNgI8210CGWoa7CtBxk
 aDKfnLxBrSUz8CMJiACIrzpuphTqUvZbdvTdqcIvhltdDzZHFypMd/CsYM9Xph7o626x
 IZPw6mIbAdQygk0G40kdPghnyzGeQx1+pb8dJ7mzhQmZzSmcE4EokxMAc3F7QRY3s+dl
 h0Yjl6alIOttGNkZuJ4+pbeasVc+RLahYnXPgerhnTHKSBZYT6q+pEa9gsz7hGGdbhHf
 cWwBvkT57qKYSWLbvC3PCuF/Z4D7GvHoz6Nc2HVdkNH6FitCXlXXqf7IotkLlxCRXCTt
 oSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=839efX+7U5vYxejZ5MhRw75xUHfEI8ipzY9hkahVUzw=;
 b=pMo6ZwVySTxudVr1P+ATNJI4aL15t6ko+dYN5OMyPLzR1QXphouOZORRCfBh8ph/DV
 FQTgVbLGWle/cIq9NLNnnedOsmzQ3l45Yv0xsaOs3EGhSU7REzn4Ldm/e4KD7PTPjqPf
 /2xElVx94gWvQHh1QBoPZcygsGzLnvjhTdWltfisRVVLqTstPuutSBqTrKGVdhCJDQ5u
 0z1pFr5DxGsSh9dlrA8AQV0jz8N9iQ2eOloO1KnVtM0eq/dt3b6FjhC8AevBSbhO1MsO
 WkxtWU741gRBhFIP691B1VbWNBqpGZ4GPYkFvFKkE63Qv/tUJL5DCHJRFPAu2Zxq+VI4
 RcPw==
X-Gm-Message-State: AA+aEWYXNk4MyOF1SCCxYtvnYr1FcuGbCMCPXrKAyvLsoLBCbAY1I4C7
 OBYUrMHenmSNLAGJZ/feod91Og==
X-Google-Smtp-Source: AFSGD/XcTh+i9kOd+GaV+Vgnk6kzn//dXHYSavPhihgQprRSECGw/x17G2eYjMlUkQflEAQ88DGMww==
X-Received: by 2002:a17:906:5795:: with SMTP id
 k21-v6mr18149045ejq.238.1545994284272; 
 Fri, 28 Dec 2018 02:51:24 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.home
 (anice-157-1-157-17.w83-201.abo.wanadoo.fr. [83.201.132.17])
 by smtp.googlemail.com with ESMTPSA id b45sm12919494eda.34.2018.12.28.02.51.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Dec 2018 02:51:23 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] gnss: add gtop receiver type support
Date: Fri, 28 Dec 2018 11:50:34 +0100
Message-Id: <1545994235-8309-4-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181228_025136_043919_F04CB89B 
X-CRM114-Status: GOOD (  10.44  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a gtop type to the "GNSS_TYPE" attribute.

Note that GTOP receveirs support a subset of NMEA 0183 with vendor
extensions (e.g. to allow switching to the vendor protocol).

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 include/linux/gnss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/gnss.h b/include/linux/gnss.h
index 43546977098c..adbbacc00278 100644
--- a/include/linux/gnss.h
+++ b/include/linux/gnss.h
@@ -22,6 +22,7 @@ enum gnss_type {
 	GNSS_TYPE_NMEA = 0,
 	GNSS_TYPE_SIRF,
 	GNSS_TYPE_UBX,
+	GNSS_TYPE_GTOP,
 
 	GNSS_TYPE_COUNT
 };
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
