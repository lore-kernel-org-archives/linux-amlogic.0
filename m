Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF8CD13D2
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2026 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tZNoz4VZ97BaaocdLbfX6UNSOhrFAlJ3TuJ14iK3xNk=; b=XlI8+1K7hJZUy0
	NvQegXR7NFjZzW1a5jvqvGxcPNEtqWvvac3ByuFY3oeb51qEBT0xPdwhodbG4poARPl4eMBtQpHxQ
	UqpQlh/t3f1682o7rzMue9tH0toKmW6sCv8w5hFdlqqDNxNApVsyGFz0anT5UnG0lxheWqmRaM9ii
	Y2q9iSQsMfk3B8oISa0PqLEYQSqd95x2L7seuXvnb9BTtLTHsNeItSWsP46VTerhRUzwGDs1Gmps8
	AH91Eh+lYVgo1Sg7f84Ml/cdwsdD3Qo6sNz+y/g1FtQ34OL3JXoQfMnZ1ie4t08KWs5MgO+QbKKzZ
	Z4oxEedLIV9DHjKVA9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6oE-00000003qBb-2SLu;
	Wed, 29 Apr 2026 15:26:42 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6oC-00000003q9C-2Su9
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Apr 2026 15:26:41 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8eae9229110so143589385a.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2026 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476399; x=1778081199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS3dtDxzU2kxeMHxbKYApVqMr2WXis7MX2GRKVmVEqQ=;
        b=FtXuyK7KH9KVCNLtuKRWv9PCyDgYMa1QWLNlNtX1ymPMZIbaoKQ0PNrsxWtOS4v0Xh
         W9zKAKmn4vGa9ROKdZdrNusZjJDCOhSMffomBquZyqPcv1uumcWbcUG6Ey4AG+MWmM5r
         fAi+pNDVFOMJuA9siYjBujZpy/dl4ab7waudJrXs4za2O+5HCU+lJ0MVG1xcMeq5/fdi
         fIOMImpkziqzsPV2KOUaIbCtjH4aTJB1/mKmqArFfItkwRCtaTPvH5CPW8PD5kdhpljW
         52/HikH56K9svWI0AeBvYC30NS03pxFPaiO2f5eCydq2tQkftaukltlRTEuNzRfL4IkX
         Jbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476399; x=1778081199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS3dtDxzU2kxeMHxbKYApVqMr2WXis7MX2GRKVmVEqQ=;
        b=YJhWbJ/57gMFOcLHSwOvQcj5bfoYLGsvGBaRtqiavm0sSjwzaT0WpQ93bEngceAEr2
         ND6ELQJ7SGWVxPb2NhkcFT14OBFpbpOhg82LeMnXigCRJBmN+Ej3rTkaY+KEwOXSt2W/
         l1bXCEgmQtxf6yv7nP3ncqvsWhPRaI0LKB1WilUlcUwvVvDrCOULOYXGbcvBTZDQwFTy
         oyNv89AmO+Ol6DayFV9CFUiF3oODayhtXKrBu5oIo4rbP8Nc+/cfWRnrSi6VmtGlfty5
         /Sle1raPsWWf6eJY8T4VYi71CfMlMeu/d3cNRuPefundHNylfIZmm22wHsvSjoiwa97y
         2AIA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rd6gWWyvqZorYaQMIVK37fWOvP8EisiN92aoDLbIENvUqLon3Ez9u/M7uf8x8tjXT+vlXbXIues4sxrtT@lists.infradead.org
X-Gm-Message-State: AOJu0YzH8IsoRqOMtRd2DERgQLVtFaO983KYYfJC5bJocp1CWvQLWm5x
	f+5k19swi5a9e5oRqn9/SMf+WWN4UiAf7uag++RLTnmC02RohhmY7Crz
X-Gm-Gg: AeBDietshuJWI0uJoUC0F0/2xxrOvLuArIaruLJuHp9xYOcpqAX1d1wPgRytlziDiSC
	0fyR6ZabmJZMJfOnxsEQQ98O77sr22baJacvpQuXfjOvUbK8sKDOxVc34Pexm9aG6JSK62wHYG1
	gO3mYga1gGqnoLBiCvpj0A6XqEa5N7k1/S6J6PKmlBji/ci5DxPBpLRW+vetuU8MPJaYSabmqnK
	LSZbULIG30/MvL6vkwp31W6blkTrap6bAWKMueDSjFQa7BkFlX0gs56sGP9i/O7k8D7hQ0wNQ86
	vEVywqTEVkvshqtRyRxgNPSSSdKmt4LpQn6gSQ7YjR8prDkcCg/2EdcKLH6GtlVOs7jLcBvpLGj
	X3ihZODiMZWhXQqJLWq5o5mrPYq6XRQejP+iDbPx4zpMB0en/hMryt2SE/hQFlkIOpidxa3IsKR
	xxwuCYoMfMRwDpRL9cRKQr/YJFZ7rWQabvMiBgChnyk1W2dXSbPhHnSgY6wOy2a4WcXOhD
X-Received: by 2002:a05:620a:4081:b0:8eb:73f6:b5a5 with SMTP id af79cd13be357-8f7d950233cmr1109929485a.44.1777476399131;
        Wed, 29 Apr 2026 08:26:39 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:84bc:8954:e2b9:d27d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f583408sm202219285a.23.2026.04.29.08.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:26:38 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Wed, 29 Apr 2026 11:25:32 -0400
Message-Id: <20260429152532.29302-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_082640_628495_BC001013 
X-CRM114-Status: UNSURE (   9.01  )
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

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
