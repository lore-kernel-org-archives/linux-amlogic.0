Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34472C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJk0xViz75fWRyib+EDUWXnG8wJZ/I8APSJRTVKgtRs=; b=3VXOQOsJGwQh3f
	xy+q9nXAaefBIGrpeNZHxLoTpeKvxNGLpC9pLfjZNB/14AlTSCUHpl9ODNXtItk1b/JdlCBN3zRDu
	4o7ZW5pMkyc5X4ALaRLTk3oR5XAaPgWRaTMIHw94SdrQ5BLGBeRgj5Z8jSPCuQTo2KPRXMr2XX30q
	RzhFSBl3mpxuUsC4K45iqnLlmVhpPOIS0aLQTuxocdM2EWm7TsYNKGkE6FTpWLLFm5co76i+2F1ZP
	TKPZfV/VdlnR8A+eRaZQrJ/eubnEVOdwgX+lApnZdOKf4NR1YYjosDiiRuzC730f53FJkK7aH970C
	ZWSeXC6TsXhSwUCzIy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoRD-00000002QCM-0Ipj;
	Fri, 14 Aug 2026 09:42:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoRB-00000002QAt-0rYB
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 09:42:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caf228a910so7495225ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786700572; x=1787305372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=;
        b=qVMC2WdIky/WHrbla4SggfGjE3jMQIsQsaNhW5Rr1fORfH+i0Q8L30zAjVMu3evsCr
         Y6cb0Lqj8HzIBt6RB3eLAcjpEfW+DZ6NyRrzFcV3EqqbF3IhcLoY8pZTZ3HgP9Eh7FSX
         HXKfHgoYTIA2vhkFO7w/Yov+9xJi8BJt7P0FRFebQb4VcSr7oI7G42x9sApNYXwa6WOL
         PInsh4qeSJToLnvoAxxugQT8LDRbDox0iRWwsW1TNNmbJgWhAzCC7l71JKl4ZrHHFOOC
         ScClehW0DId2DLFD2nw4y1KVanVJnIwlKz10TJljNmCI1DBh19aQHK1unJy+EHIrulFg
         gQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786700572; x=1787305372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQUfUfTTlEody32mTsvlfp+8+YPg0H0ekzGI3D7V1rA=;
        b=D3v89DzplGZILyPIiFTvQynVJ7DH1vppBH10XlFJ2fWGYUbRBwdPHCQYeNdw/MNzV/
         by2ZlfnhbUKoqra8a/HbzATRx0Dav6dJAllnA+RCHRJfCidGYWLdT36w2k1Mb3yjzl5j
         2KR2UWL2XWLe4ymYdbRHlH1l+Z2KSeGgGinc3hgRlNqh6IwYplMtdXvjta4e4ycN8lAz
         VxpgJNBm5/ZoRv23SkJzvdNZ0MhyI+XAjrtBhJs87vry7ZPFs2Cn6sIwoJlEpFaArmUf
         L4Vf49TUbsI205nJyWUQFQd0b+rEYsve00xdHgNfnT84p5HNR6KCBv3MH6+RFGAk4jaZ
         /mmQ==
X-Forwarded-Encrypted: i=1; AHgh+RophmtCVzCCjvR+WsbN38LFA40o36AobeFZSoSWG0yufK/VZTkaHkqpohkxysT5de7VHdCsMmqwzCwTaMbv@lists.infradead.org
X-Gm-Message-State: AOJu0YzrnJxo8ytpejMwJbGSfxlfOld2ksAXVGAnL++cqcbZFTAtM6My
	vxk3UE/T3SuoTMkgWsOUfFt0oyqVqJhGutY/EYrJPya76tmLyfeTpVnf
X-Gm-Gg: AR+sD11WumhQVp/2XwY6syUeT1zgx5EiXXvcwZs/9vN/uHH3M4z1cLdWSkFWCPQF+JP
	focHkZ2wcxMEtK5P/YfqhsGK05YyJTzhpxRoVMnNyoiELsjIhK9kcLtk5R64mxCzzEmBYPXCKz5
	COC90vcIhu751mCDzvjw84cyAm2ZzS2U8fR5AFl0FNlx7S9O3Y2C0FJNOqP8P45l01oDSA3ZH7f
	1VUdB69mfnGOF2KacbE3kfmoeJ5uaj9pNCLLYDVmT2NGj9254cg3PtotSzyVKWDsZ3qaT87Cw1/
	yLfJ+7Xpc96MdDREze49oriSo6wmGhafGdc5nALCK+O5IIa8G+fQrBN+wTDF4YQfpq7RzWKJuH4
	mM+rez6Cgj6tWvlttRdQT5eyToNHVfTIIihUrOGquFytt6Ox/SlI8sG9xK7hojWt8ZV4mm9fjeA
	Za2OhA+H300RNy15Nl9HdEaV9fsdlTjkfXutjG/ssVt2s1fU6yLoc8nEKc8BnmU/unGIVoOdgN5
	6SP99lerMpsEGgPqBv9FE1a0AM+BUU2paq/VCb3tnrHu0/xw+66wSjAG80jjw6aIie5c7/EL4KB
	ec7g
X-Received: by 2002:a17:903:390d:b0:2d3:89fb:35fb with SMTP id d9443c01a7336-2d3b04c40a1mr57522695ad.0.1786700572325;
        Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7c067asm7446345ad.28.2026.08.14.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:42:52 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe error messages
Date: Fri, 14 Aug 2026 16:42:11 +0700
Message-ID: <20260814094211.25151-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814094211.25151-1-phucduc.bui@gmail.com>
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_024253_252768_CD337C53 
X-CRM114-Status: GOOD (  10.54  )
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

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/meson-card-utils.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f2796dc84fa5..e4c3eda24d82 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -290,17 +290,13 @@ int meson_card_probe(struct platform_device *pdev)
 
 	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
 					   snd_soc_of_parse_audio_routing);
-	if (ret) {
-		dev_err(dev, "error while parsing routing\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
 					   snd_soc_of_parse_audio_simple_widgets);
-	if (ret) {
-		dev_err(dev, "error while parsing widgets\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = meson_card_add_links(&priv->card);
 	if (ret)
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
