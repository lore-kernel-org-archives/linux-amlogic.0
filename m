Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB2C43327
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SnY8I+JcUVm3w6kpJaecfasoMVI9Lh/rQ+LxQwb5opM=; b=voFRF9LKT/LDnS
	CGXbACmgiVmxzlCZH0/3yDLF8XzElKO3eZXMEbk4QDa8aV+N95SWiyTgPY/ZPZWj/RIQ3F5SE34hz
	8YKeczfrofb+E4V+GVayuMJebjQo+1vjt/yAu5I4bFlomwihqt8ed7KRA1Gzg7Xomj1GRIjjcd2en
	3IRDKwtAxbUw/ZNT+H6P7NOYMuPm3eyAxlJuf3iOUkBIxZmDseM2D8iZrvYoFVggj2wpnpdjUAfgM
	WdomH2A/4QQuURNeCRy2uEi/zMMzpvzxvlbBdWCGbtDzWyzt7I/wapWHd13G2464VjQnExt0pF+R3
	wmJlWSYs4H90ltjYMa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx3-0000000CEKM-2Dbr;
	Sat, 27 Jun 2026 06:55:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMx0-0000000CEIR-31TK
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 06:55:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so7186475e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543337; x=1783148137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=h4MPjb7oJgch+TFHnuKIUJ5CRuum7YMncQ3DTeK1Vn+xF5HGH3wXIs7uWRtBy1w+5r
         jAc6g/Q5iv6d0dDGIXVvqEELl1qOCHpQWLvwrEA2y16EUEetb4h8Gr3WYhxg9Hy69Eqr
         fp05ej2vvbKM0uhLo4loGF+idQZfhBDCPxlKoaJj07N+vccuW74+qQj8B0kyevvfvRNj
         vuiLR4vteGSgQ9lN8va094tu4R0kPnvSOEjUNdKhHxCrhVqhMtNAa3wGMlWXMI6qjVrN
         At3k3VioEeGdCax2EPooTqD1LpmaWlQ8Kv5xjH+k/9uX+xNzJSo15ZltJ8KMx+hUYK3+
         QfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543337; x=1783148137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6URRVOLLPbDGmOPQIy9/O+A7E0jEC0aohmFeB/EeHoE=;
        b=tLnpra6e3Kxs1aXJ/QAtsPNLglYdfORUIR7meFeEBkNyxu0phrJDlXV9rsI7PPMaOf
         dW26MG5KNWUg4VbNbvbThYoeay2XBeN1oS3XILDkj4gKJoRw4fMVxO+Pn8nH4B318OTp
         aljPSG9+8A+hI3ASptJx7bCHxVuoZWubtdXc23kBK/HDLhq6VqMD7GYT/XghLgSGCtL7
         4fbpfpjwlqiyZ2MwzayQiVSlXhy6sWix84JOpz7+iBbjfcFZQdqcBkTwo5xdZEC35oI2
         MDXbKlu4bEzZHNFYIVOVMILX1cFVpO7nCgHnNdYBgrIdc0K5EsGvzb57JkwAi07KE/kz
         cgog==
X-Forwarded-Encrypted: i=1; AFNElJ//ygJqtJelJBOv2aFxuIKzWPq5aIGsthCT0TB7WJlmRHMsjn1XnKiKRWjnAfzU4ZUC0w/v1KTbQYNXUaxx@lists.infradead.org
X-Gm-Message-State: AOJu0YxiDNztY7TVy5oH7MsxjCHlmDChQ1pHaCIHSHtHV+MIuuMmb+I7
	xA9TOwZZrDtiUXTZxNs3YwEHWDw5IrrlxGepLrXd0WbNYDMb5ZMnto1vGPWSHVtqb/Jy
X-Gm-Gg: AfdE7cl/qblZRnHmDfvgotsGlnbRYIybcoR1/AhKB7l3Bgq/qjsxrMEgKTxpQVpqdGn
	9Qbm2fwA9q7AKF1bGYc5R6OJ8vlA6EyckMfF0FRGLskJFBbZ/dyQDt0Qb6+w10LBA+mtojQ+nqQ
	7lSBxVsgMKAGC6pVQypT4fmKsZuJ0oBLrDkzedVMMKbtFm7FaqpysdoNs+/F6A5XX1fO18MWnN3
	FwodAEezob6lbtHE1MtUnf+26Zb4WOnTSogqGU1Ympgc/xFZ4TmdgPOSGv4cAJY0YXR9rKonxvL
	HN0R3SIutAxXsaOwLG7sma4WZmIZKSBSVt0ULfGi68B3Smj7fCEH6Gy/+QleYKX0oTwIw2i37Qz
	Q7h/wBOuT6+MDuo2xSR9g9Tl12bLS9JLBkoOLok73PtUsle+ObFAVRN5v8SFf+FqtaB9nP9uvTJ
	VyWOxWAb9UpVXe1vmddbNz9CsaM2jXaX0GaZ76tS2lz04/SK6BpoHKfsusnpLtxhTvV1CTPxddi
	KVgLPe+aAB1wlZ0j6ttzRg5JVF7RtWlyH4=
X-Received: by 2002:a05:600c:820a:b0:492:6eda:4296 with SMTP id 5b1f17b1804b1-4926eda42afmr59822545e9.8.1782543336727;
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:36 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 08:55:32 +0200
Message-ID: <20260627065534.88527-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_235538_801696_15213FD3 
X-CRM114-Status: UNSURE (   7.69  )
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

While reviewing the earlier VP9 prev_frame use-after-free fix, a
Sashiko AI review of that change surfaced two further reference-frame
lifetime bugs in the same decoder, both rooted in vp9->prev_frame /
vp9->cur_frame not being managed across all decode entry points.

Patch 1 clears the cached prev_frame/cur_frame pointers in the .drain
flush path, which frees every ref_frames_list node but left those two
pointers aliasing freed memory; a decode resuming with an inter frame
would then dereference freed vp9_frame storage in
codec_vp9_set_mpred_mv() (use-after-free).

Patch 2 guards codec_vp9_set_mpred_mv() against vp9->prev_frame being
NULL, which happens when the first decoded frame is an inter frame
(malformed/adversarial input, or the first frame after a flush). The
function dereferences prev_frame unconditionally, both for the
use_prev_frame_mvs computation and for the previous-frame MV read
register programming, so the NULL case is a NULL pointer dereference.

Both issues were found by static analysis and are not yet runtime-
reproduced (Amlogic Meson hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Doruk Tan Ozturk (2):
  media: meson: vdec: clear stale prev_frame/cur_frame on flush
  media: meson: vdec: guard against NULL prev_frame in
    codec_vp9_set_mpred_mv()

 drivers/staging/media/meson/vdec/codec_vp9.c | 37 ++++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
