Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522E4C43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:49:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2787D20644
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OF1rcXXP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eNChcKNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2787D20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	References:Date:Subject:To:From:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=6TjKHJ9kk4JtElHzUuPiQw/H4R24y/OKfCb4G448FGY=; b=OF1rcXXPzatVor
	RxUtbbezISlHcSnmVXvfQ0MByp4fmt01+TL1NXAfMOqjCmSnG7ipgq4zMQ7uwhx6SESqgIKiMVga9
	49q252qx6MgYtX7N4tkDoXF6mZzi1/6N7Bdnz78LYhetdpLtrP4sTnoNFV1RzW3dTmn/qdnNYmirR
	Q21UAsUZ7aI6pLjITlYlhizScTF+B/v29wGz3VRgEJij7LjmX9MR1I9pS1Zpq0N3ciWIvV/aizGw4
	jsZujLGC7cQvQ4VMQtr1PMoDVV7O76BsKMfN/71VcEr/25hjW6Ts7qfFcXkzn2mrFJgZ/O90cM2HQ
	pAr0uXwJR4EuvA/SHNOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfQHJ-0008EM-Hc; Mon, 24 Jun 2019 14:49:05 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfQGU-0007XQ-16
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 14:48:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id w9so139205wmd.1
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=xaKJDnae1EFjh86fZ1Qltct9/8V3S9KXOq3PYZYvyHI=;
 b=eNChcKNO7dQANYLf2uCgCftyZNvelvdSK9R+1wtb/lP9OqVCiyaG3OIdIrJvfY5CIT
 UY6txHTM80Vo8+OFktdSz6aeq0tQrXNrcH9S8vrofzKfN4JIMdEv0cjGK/tg1Xnf5J9r
 LGTDyFDGYPkJYSN3BL2uLc7MFCMZj8qFjO4wv/q1Z4WP5PJZaNPa1Quw7jUcK5mZwsCw
 bxOKPjYmtLYt6DMV9GRNb1VFVsyCrJseC+dwSBZLumuyrzMfUcaYhy/ugT8CsDxtM99h
 kr+/TsVx7bAyAIowCC2Iuo0mz79kTiaBTIQgYSf7LmCriUKVmfYEcTchX22VzgZR06tj
 3XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=xaKJDnae1EFjh86fZ1Qltct9/8V3S9KXOq3PYZYvyHI=;
 b=EhOexKE2+YIS8/i/aTmoP1XAi0SbTxbWs0MemhP7WPH3SSXArqY42Ijx6hfV5wFAJW
 fN2tgibk0bBbwI7UJEYQBYv7onLqBF6igMkiX6KLSnX8g9JQzYLVwWD7gfcxYJ0YyWf1
 wiLNCx4vqSh1cFt2J6+njZb3OBmAsUT41Ig6rKDHtELfmGJw2MhBrq+z62gXvo6USx2z
 foDcxmOCtndwrIbVNeUY7mNzlpkPxEyvJGm3THqF4/FdKID93OIoTwOZfbhTZUccCf3w
 Pd3H9kKHChKDzSTRmFNHwCvS/QeRknKzIzxZx8eP1weJLSR5D8wszRZSfsQvSLvWu0rl
 mCAw==
X-Gm-Message-State: APjAAAUL5lOmpHVpLeVesd5wfdmShzoGnh37gm2QQ9WeUXoJTNR3nYi0
 7rcKZ5ZO9iabIn7TLH5aOULOqUL0HNaSBw==
X-Google-Smtp-Source: APXvYqxMhHyWV9UpqhUB/TjiFBls09nQ4ITZssbVwFmGLt+2Qeug/pb+O9Tv3bAeSgwK1fKA3bQl0g==
X-Received: by 2002:a1c:21c6:: with SMTP id h189mr10837205wmh.79.1561387692414; 
 Mon, 24 Jun 2019 07:48:12 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v65sm18451669wme.31.2019.06.24.07.48.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:48:12 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/9] drm: meson: mask value when writing bits relaxed
Date: Mon, 24 Jun 2019 16:47:56 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86y31r82fo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_074814_198833_6A4DD15D 
X-CRM114-Status: UNSURE (   8.94  )
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The value used in the macro writel_bits_relaxed has to be masked since
we don't want change the bits outside the mask.

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index cfaf90501bb1..c7dfbd7454e5 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -20,7 +20,7 @@
 #define _REG(reg)	((reg) << 2)
 
 #define writel_bits_relaxed(mask, val, addr) \
-	writel_relaxed((readl_relaxed(addr) & ~(mask)) | (val), addr)
+	writel_relaxed((readl_relaxed(addr) & ~(mask)) | ((val) & (mask)), addr)
 
 /* vpp2 */
 #define VPP2_DUMMY_DATA 0x1900
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
