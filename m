Return-Path: <SRS0=s8Yl=5N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7363FC43331
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Mar 2020 00:42:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C902071B
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Mar 2020 00:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNvuEgW9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IptMWCxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C902071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T/lrFlevQr1xgPfAg6mvXpMXjXR80JzVbDUCgKExozs=; b=KNvuEgW9GDV9zr
	esu/QDf4Ae9o8BqnrfgAeaJAg38FKyjGFaad3OttjSBr6CMJxqmFh05Q5ElLp+OFB6PHZWY6BfWJf
	zLYFvOra04gwXcMmqdScDs//mai028CF4WC9iaMkQo1vyprYt6YhDvebQroazV4ZOzGBf2ax2oCNO
	Dcg0aLnytscdoZAYC61Z+2MV2Viv9M9KO4rrg2dqyHePnCxNTS5WTzqaspANxmbGBb0b9ohbyiPr0
	7ZUJ9Qer2h5bq+Zh33HietQCXy5pH2IL9UMyHB9C5qcEahoekl2uLdCJaSfo2aO+rvC7AxtEP5av1
	EH5s28+hRfHnJ5kFlaZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHzYJ-0001Ep-VY; Sat, 28 Mar 2020 00:42:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHzYG-0001EB-O2; Sat, 28 Mar 2020 00:42:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id f74so3746739wmf.0;
 Fri, 27 Mar 2020 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CyGjashJridaD7EOncRRtljYVEVx0U+lNGZaPp2V68Y=;
 b=IptMWCxZLROI05RPdivzL/MiF45cGIjZgNtc4RWBqeNsCIeOsisxtfQTPTt8Frvkew
 GN/AxvkeF6atRjS6S3g9JimBi6e+6Bk82g8Kht9L/S2NyD5pdcnOoFcg6aMxUMN7S7/u
 9DmgWye5ERHiBSRmiJVyop0S9l/19iYR7YoPc5B/PmaQbJROP7HSsMhoD8qFkmqU7SI+
 +9J1dr3mbTpX/ha7onANt5lsOl1GTqzf1YdcHKEgMCx4uvTtHWNiSVf7Urvn53nWD4uL
 vkx8ECR9Qg+8tqrr/FJk/rLzrqcjuIG3FB9/ejW24U2df8cK+RUZkhLP3bARtDZUy+ex
 HboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CyGjashJridaD7EOncRRtljYVEVx0U+lNGZaPp2V68Y=;
 b=RuBLHuhUE6dMn9k+SPlz2hdhrAuXoalvtSKaH9US5L56EV+uo/BZO508aE1leor6Ic
 Xci9dzkjxfcsjq5kJgFGbAI1KZPMk9RUmULz/l4drx5jBoEun3aTnKpHlB9Isl47FR8E
 MrYzSsSSV4hr9eHYd/geJyULlvPI2zWtrUc7HG7CWtta3SZeQol7zkDfHadq62D0LwRu
 QD5YX+30CwDiwEs1qmEGgrVYAo4CClaVdVV4vHJyj5otjESAINbNgZDBfxv9Pcm7a0UL
 zLzz0bhAqt0HX4oQcJ6mcEWaiK6mCLDjO0sVu7BW6GDVA1wv6rVoFcwGh89ySKhHy3Tn
 dXxA==
X-Gm-Message-State: ANhLgQ2iPpk9bK3QUBCAxuhw4hROY2d6VUycctPfAuOn+ygEM3dSunm2
 reg75MNbC+ZTOeUgDh4LMOfI1dI3
X-Google-Smtp-Source: ADFU+vvlJnYzsX+ao1dSJir0qYJy7B2HfzwRuyqzEeXskD58u19UIKeamdohRQLTKyIpvAMohyf5Ng==
X-Received: by 2002:a1c:96d1:: with SMTP id y200mr1376296wmd.114.1585356135213; 
 Fri, 27 Mar 2020 17:42:15 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id p21sm10783857wma.0.2020.03.27.17.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 17:42:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: meson-vpu: fix indentation of
 reg-names' "items"
Date: Sat, 28 Mar 2020 01:41:57 +0100
Message-Id: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_174216_807922_0A5C2CBA 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: mark.rutland@arm.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use two spaces for indentation instead of one to be consistent with the
rest of the file. No functional changes.

Fixes: 6b9ebf1e0e678b ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index d1205a6697a0..cd8ad2af52c9 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -71,9 +71,9 @@ properties:
     maxItems: 2
 
   reg-names:
-   items:
-     - const: vpu
-     - const: hhi
+    items:
+      - const: vpu
+      - const: hhi
 
   interrupts:
     maxItems: 1
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
