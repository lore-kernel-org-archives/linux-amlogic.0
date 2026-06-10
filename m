Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AFBCD98C7
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DphzteYP8EGQqT2jNU63BXokHB8fwXv0WJROqi0uyW0=; b=jzTqncsVy/DFhn
	t4lb+O2m5LtzI3xxEp9T1Tf6vOtEpE/lWpjHM07K5ohQy3OP22IDbiD5PSjXMgg2JNLZPwKHa0Cno
	93r+al3bastKmsEBPP7KBrTvwKB3Sla0WDRKW7dvGjy+B2/GaClmNB1eZ9998nsszxx6aC9Hijl4O
	SUwVB4AbWLMnjvc/kW8GbjFXDe9LjFK3B7y6qm1TMyMphunqGSQc3kTtmziIlCRgyfdC3A/0z316k
	KYRoeFKAYEgGr/u2cpD0hF3/9eLxSobGufAvRO89unnnIwRpOlY6YktdpBlSYHwih/ogt3LvhHnjk
	wNo8OAuNrLXjyruC3CEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG4Z-00000007NvM-1jFd;
	Wed, 10 Jun 2026 10:22:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG4W-00000007Nta-1vsC
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 10:22:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0c3315c5dso68735085ad.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086928; x=1781691728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=;
        b=XqUUctFdGx56syC92sbAmUyO/phPqzcnTJr/qgwU4GdcQ7oVRGkWO6L2NAvxYklSfB
         KYliBFiSSxupoLEmKE4alCoSX3SQNJEttrjpljmSEnmHp+WHRzKZWJAkDtAq6pHjKIIn
         VpFj88tqOkrTph9pAuw6soaw+JAD23Mw7aiPPFFrOet63Ay8ecnVQD0hrlsArAn7a23l
         fC0xd5sU13CUUlRNfJ3+G8Xpqf9kE5ceGggO84GOB7ihWu54FfLvhI+rteK7xB3FhPCr
         9a/9IF4EgpmgDCe3r+0ALfTd+snTRSgWkkU8tG87x0d4H1ST6VezECCOVjALdmszIldw
         F04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086928; x=1781691728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rPTGNjskcRtQTw6mA5VpAqBzsjh0SlCyTZZ3Fz9+0M=;
        b=bY0pssdfjvLUqVCZFAWLTF34Esqa9TXBdYYZTy8sAzzhlnENfIarGIouuK09sDj6ZK
         +m5yqZugaAsfpi5bPvDVZr1dz9TPPMiMijTRIWHEyJeba3LOwfO+36TnqEi7jxLZdEnr
         QlQZR5OzPq6OhUnKV0/fv9psV6DnhDtU66PGaf+4BtVcjX9nXVENgWy+OhnHi9YafrQ6
         vidBY1hASrJnLzCHs7GpdwkHKZazY5ZhWtU6HGAwuZuDgq4G8m7su8mufasb9hPPDpGZ
         Yz5pSkDqSyEqHp3enJgJM3bDIJIk0JGE7f4uZp6dvDoLqTHjUVNBfJn+rTtcnmXDOawx
         9ysw==
X-Forwarded-Encrypted: i=1; AFNElJ9CniGnzvFRUpp+Vy9zr8jEI61S4ZGcEZHPwHj3agzWItM3Y8x7BAZoKkruQ89E1/NZMSmkbt7ODHqmHuPh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd1xMuqAs/F11RBkNEB/WuB/T+NMvfjKaQAwRZps9yvzPJL/6Z
	Pl6zsC7v7Jg3dFXoY3jmac93ckckEkowqMvbKE70OiQXYM6fHZQrGFM0
X-Gm-Gg: Acq92OEjQzUG4BWPXPMQ9nohASoge8zFl1venPJ9YxHS/VqgronqVTDSPyRqstdtlSm
	M2nxUGlFO7qBTt/Om8ErWDygvjSs95Lj6k9UqVM//pDPQcknJ1HJkGsNSLA9GqOe9iLoT1iSVOu
	DAVK9SG/+F5sZU2XhrpniqtN86FBZvZHeO+Hme16PcJ11AtmRVhaAq5NREGc9ReSEiWqWEmzhAE
	ObAI0sF6DpcRPu/xi6mwIbX422O9mYTdToB3yp1H9sIVJllSxm52fR7onD/qd+yM0CrbCV6YrBD
	8URnQy/C6QLaUW9TvQrUTSm+G+9yr0yP75/z8HfbOV4tajdaPqAJs5j0GecAgFqxe39AcKpNjyB
	JfwtJM7DFTIfdlUErOiMv8aqJdz+gDdXA9PezbAwyIU94xW60Zs7CXWrPM2vUBzUzNvCIrj+4ky
	KBqht/0b5dQ/txsNLo+fVcnumjx2voC0lsgK/b7qWrhtmVN68jh///s5Ds7uDqAhEEEX7e
X-Received: by 2002:a17:902:f711:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c1e85ad8d7mr289553825ad.33.1781086927749;
        Wed, 10 Jun 2026 03:22:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm239924075ad.67.2026.06.10.03.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
Date: Wed, 10 Jun 2026 17:21:53 +0700
Message-ID: <20260610102153.83367-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032208_499566_90D81B1C 
X-CRM114-Status: GOOD (  11.11  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index f451e4dce442..a6ba401104d5 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
 	struct axg_tdm_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
 		ret = axg_tdm_formatter_enable(formatter);
 		if (ret) {
 			pr_err("failed to enable formatter\n");
-			goto out;
+			return ret;
 		}
 	}
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
-out:
-	mutex_unlock(&ts->lock);
+
 	return ret;
 }
 
@@ -178,9 +177,8 @@ static void axg_tdm_formatter_dettach(struct axg_tdm_formatter *formatter)
 {
 	struct axg_tdm_stream *ts = formatter->stream;
 
-	mutex_lock(&ts->lock);
-	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
+	scoped_guard(mutex, &ts->lock)
+		list_del(&formatter->list);
 
 	axg_tdm_formatter_disable(formatter);
 }
@@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
 	struct axg_tdm_formatter *formatter;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 	ts->ready = true;
 
 	/* Start all the formatters attached to the stream */
@@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
 		ret = axg_tdm_formatter_enable(formatter);
 		if (ret) {
 			pr_err("failed to start tdm stream\n");
-			goto out;
+			return ret;
 		}
 	}
 
-out:
-	mutex_unlock(&ts->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_start);
@@ -352,15 +348,13 @@ void axg_tdm_stream_stop(struct axg_tdm_stream *ts)
 {
 	struct axg_tdm_formatter *formatter;
 
-	mutex_lock(&ts->lock);
+	guard(mutex)(&ts->lock);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
 		axg_tdm_formatter_disable(formatter);
 	}
-
-	mutex_unlock(&ts->lock);
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_stop);
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
