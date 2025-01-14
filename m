Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E09C02183
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2025 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rkr+MRUsYf2elp4fw9ez4cn/jPM0lUAP1WbltK9F+ZM=; b=gBjdDQMcIG2jnP
	qlT5QzNURG91kincY/EfOmFlYJORmCLALTXAylhWkqvehJ/+KFoeIU3j/OoSW6HzxF8JXsOWPSw4y
	4Z0ADbdp0jPZpEuPpEqezqt4vKorjRxxbbdb7SRCT3wSQgC85mKYIaVExak011/9ABIBkb0FWynpB
	iwtiBqmXPlqzFkql8GjG72uKTBZofk5uoNcS2Lv67UoEDXusXkbBa1c5q732FtzuF6tXqVqDCfN3o
	S6pPEWWXBTsDb/WnJZ3LIiHkAhhk+OsiTEjSSmAtN3m+GV6tQRT4Fh6eVlMf4c06Gj+aGpMsDbPCm
	ZIRu7RCaLe+uzMn4pLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoth-00000009rYf-3X8I;
	Tue, 14 Jan 2025 21:56:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXotf-00000009rXV-3bQl
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jan 2025 21:56:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3086765f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jan 2025 13:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736891786; x=1737496586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXKWjW33EVmkp8rrg/80R5P4ho/zMRHeOuQ1bTbedC4=;
        b=XfCe+2/0Q7ZujoNrhAEzKa0HiNtVn9J7UAf5yq9LRadc6l9IrCjzPE4XfOcKEgYbOy
         ocAZq5xI/3Zq5SZXchXCZp9lZ4w3N0WzMFCAPb5uuKoFpgDhDj90c3+qIa/hetjHCEos
         vBbvj+dCV7xC6BOKgO4bGoiQDBm463mKy+TLj9UHaHd/qopP+7WGlqHVg9Zl+us2FoVr
         ddqouSG217LVgHaKZv4mjeqIfr/IbymOw9pt3Uumu9i4zw+FYl7rEpGyMdzsA4JminaW
         roBZY8bkiJqzpUCombEhCdP2sdiiHQRIOoO3h2yYUDKtgRSzfEVAIg/iIBBxTdy5PUgv
         2Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891786; x=1737496586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXKWjW33EVmkp8rrg/80R5P4ho/zMRHeOuQ1bTbedC4=;
        b=aWE501Hv2ged/qjYqOUo1Kj9CK/TC9xt6gES/eTAoLMIW8WNUoL17zaw299EzispQ4
         46ZViGKdgx+jH6+BylscAgk8YJWZz0PqYlV5UUDt0kMUm2PB56zX14zcSj/NP6+SbTe/
         idlc027N5D0YWGtOgYAaOVOMPNBrYeo6lu7xc6qDc8ZtU/tW1qXcuMx9gdQqjHPD2gPd
         njBnKXbi9eYU632jU7CXg3d0IsjYp0m8YQ37x8X+nPRWjwxVzQD0hNQ+HGWhe0n+Ey/W
         y0tPIV34Tc6Rl5RsZRaKSSd3srQuWbZrKINeDtdPi4E+glgxUVD+4Zc7ALFXsmBApFKM
         /3pA==
X-Forwarded-Encrypted: i=1; AJvYcCV8df1XHozbnpSLRyzr4uXvYjRmS6TJo6HXrf7twWgnvIEaFgZ1WLMw+PYluXytkp/bZHi1ZuL0Xk9e2ZfY@lists.infradead.org
X-Gm-Message-State: AOJu0YyrKmXTDS8/I33zdtvPclC42jEPsVOZfyZg5yxTiqaMuDDRNc3u
	mtbF05wOJhQpqvK9AektBK0ubS1wXlgtbmoNU47mBznFnUjC2BYiXxNpcmRC
X-Gm-Gg: ASbGncsExaBBOv+bnQsf8D1Mhchc0XZcto8qUBZmV70eO5BBjIM7m2t3JgDv39/tmhB
	zGMLF3/GsVO9mF+aVEWdse1EplZVZTsguvemfmmPSEoSF7GerDI9piwd+pFQ0Rj7K7oEwo93dTV
	ujrn5q/TJEy/gH8oCOwUObsk3yDk1+Ff8dqbcC+c9iLyx0MOUF9JPfpteL2KooVqrHCQHqaDOYc
	HFLnp96hQIEHqSu5DFzEuRi6ewg/SUn+FlrNSDmk+b8Y/9CaMWCVmgYJPY3Av/YflSXlXdD0oz1
	Sj1Q0jD6bjeMn1K2I+V/OM0zVOeR9XL4rZQjsInXwWCUf+WnRdqV8EeI21z6j+66KZb3ePh240u
	wj3I/sP6m7C7WlVMQbsTQjKuP
X-Google-Smtp-Source: AGHT+IGRwXXqrdvBiLiLxR+oUBgKbuNz4YkFZTZqdUbK7noPdUI8t/YHrwrbn03GL1lOJjflJRcg6g==
X-Received: by 2002:a5d:648a:0:b0:38a:4b8a:e47d with SMTP id ffacd0b85a97d-38a8730ac0emr22974107f8f.26.1736891786124;
        Tue, 14 Jan 2025 13:56:26 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aca8-de00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:aca8:de00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5483918f8f.43.2025.01.14.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:56:25 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	ckeepax@opensource.cirrus.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
Date: Tue, 14 Jan 2025 22:56:16 +0100
Message-ID: <20250114215617.336105-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
References: <20250114215617.336105-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_135627_897303_8155D41B 
X-CRM114-Status: GOOD (  14.51  )
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

Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
by soc-dapm.c. Use this new function internally in
snd_soc_pcm_dai_prepare() to avoid duplicating code.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes in v1 -> v2:
- none

Changes in v2 -> v3:
- add Reviewed-by from Charles and Jerome (thank you!)


 include/sound/soc-dai.h |  3 +++
 sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index aab57c19f62b..a11501752637 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -193,6 +193,9 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream);
+
 /* Digital Audio Interface mute */
 int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 			     int direction);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 34ba1a93a4c9..ca0308f6d41c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -360,6 +360,22 @@ int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
 
+int snd_soc_dai_prepare(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+
+	if (!snd_soc_dai_stream_valid(dai, substream->stream))
+		return 0;
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->prepare)
+		ret = dai->driver->ops->prepare(substream, dai);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_prepare);
+
 /**
  * snd_soc_dai_digital_mute - configure DAI system or master clock.
  * @dai: DAI
@@ -577,14 +593,9 @@ int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 	int i, ret;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (!snd_soc_dai_stream_valid(dai, substream->stream))
-			continue;
-		if (dai->driver->ops &&
-		    dai->driver->ops->prepare) {
-			ret = dai->driver->ops->prepare(substream, dai);
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
+		ret = snd_soc_dai_prepare(dai, substream);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
2.48.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
