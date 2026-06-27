Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEEBC43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwWDWORf1z+aI8wmmWSTuAavxNuGQeNV7sJh7j7nDdg=; b=oEm/Lu5/Jh/W+Z
	eCLIFhanWITyPQ6ywhcfMSW3YH0dNm8g9LKrOePRa2Diob8dvxte0HCPzQcWPoX08yKBvmHLLezMI
	Fk7Mb7qUCL4jb+RIcfEXm3T1OzlILD94gfm/sxavrKriVlrHLQNQMCRcGdU9FfCmrCAjjbYNK6Fte
	4gX0zbyfjxccENA2Sg9HHYMamTpNyK4ANVV4qVbETqqiw0axejo8n2H0DcNOz55cBeDVshwrHpiFO
	YHl9bNNda3bkMqV7w2YKEFIDhFcDMQ/YlE4qUwZezyJfjixiYm1stZl+9H4FImAztDGupfAV0sztl
	A2+1eL96hZ39kiGoP3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSf9-0000000CU6z-3vtH;
	Sat, 27 Jun 2026 13:01:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSf7-0000000CU5z-26It
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 13:01:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49270f771c9so3860265e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Jun 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782565291; x=1783170091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=q3KS3Vz5/z0jqhGSQR0VmyIciukWmKiTRRKTFqTLkAdw+ssOhIdRFVKb5nhwhQS95M
         OsnOu86CKjlICeS4BKFpQeagaK2yeqshaqGQ7RAa4HjjYTBMhwdSusdQET+GqYti5tKX
         efbyAE1dvfL03gxA4wXR3j78bRQbEv8/L+OeYemQXz0wcZctvB7ahcZm/OQf3b9ZoHpG
         98Gk7FxkHz+8xceiU9DWq9nl/LWhEfpyuAz6WvPEK6HVEqq9xAURPuQNQr/gMazw0qsr
         73EPpFjpLdQDk5Wf313rENBad7qKifZLIKywIlOH160en8dfjNXGH/kkFCd9XuLdDPmP
         pmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565291; x=1783170091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUR0v8eIPO1laa2TUdjOFv7kCYeCaDsPqFnvjV81+rA=;
        b=Ge1mJ1VAPt8uV90yKkkNZb4qY+amDMHUM7Q2P8DBoibhfFSwRxTKHjNFChoY4wNRpO
         2vq84c55nLhVV36qYwyZ/SxxVisRGsFbeE0cfy8EhX+LqIFy/1zDA/YTWEpyQLh7i28Z
         JQCAMwbPzrnBQ6aAux8OkuKfUedwUY2kRp/5NFNReXODQaNE1m5H0am8Z6cOvdb5P7KU
         ih2IZhX6WoUN37dsuo6acSMq3ymEzx4piYqgHl7yEk9/5kKYq4FbsQe8X8ZxIaMdS8M8
         XKp8LaDcCuZMAj/VhO/Hbf8A0PCtTSmYjENholf0M/CJCk936KK/hcOAG/F4y7NTjuhm
         fW9g==
X-Forwarded-Encrypted: i=1; AFNElJ+Jp8PF2HmcJgV/Ouo2SF/i8IlJ3cuQZcRcGB1T5Ts/StEWTunt0Fdu1CIySJAex0OI521HPNdvTQVUY66v@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3KfTmKPQ+fdNTEGGjVZ+V48g7VeM47ImSHB+I8eo/vVuehpfT
	+hk88rg8mmMPiEkpYKKK5VVi3ccyMlcu+4NHtjvFY6sK4Y1mdBwgZhyKBhmONMcGhL5K
X-Gm-Gg: AfdE7cmi8IocCAAoW3wZ8cKRYatKLTVNazbN2UuSDAdXGcYkjQZBOKpAikT3DnYCXCB
	bA8Z9ZgVmMtXsDHJWq8kTgj5a8VlRSvl7AP8HHDO0cIxBQ8EgzqnFSkduaMHjcBxiO1LdrsfnY9
	IvaePwmQwPPO4govojaAmtZSxUIsB7UgpbFx5JhJErVR5IQhDr2jBshJx7SDbgnCOCLujbjOaKJ
	IGIYfd2oQ8EZsjTmVu0i7e1aIf908FypyyxKhxkId2MOh116f0MzhZ6Qi/Q1hs6GS/3is79WZSf
	71iPEicxRf5NrERb/2DyumA4bVZB2UiuaOBw2kfDAUX74NAmDt5SSCIayWDb4tgRBBR5b+pw7RH
	8jssiGcNkLJydA8gXT4MZ3pjR7DPkTCKdKS3TwrJPECVzT88/5RkKFe967gR1ZXVk64aBxKXk7X
	Ix9YIAj2BNtq0eV9Gg5GNx0EWNVzvJPk0dYSW2kEadlqOaHkokRJsMjngLv1sfe/lHYKwnjVTnq
	5fRS0IXDdHgeroVijaAYYarZFiyPuKbKzs=
X-Received: by 2002:a05:600c:e555:10b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-4926685af4cmr112906525e9.11.1782565290833;
        Sat, 27 Jun 2026 06:01:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c00a34esm82809035e9.0.2026.06.27.06.01.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:01:29 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH 0/2] media: meson: vdec: fix two more VP9 reference-frame lifetime bugs
Date: Sat, 27 Jun 2026 15:01:26 +0200
Message-ID: <20260627130126.78749-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_060133_556486_0FE92B4C 
X-CRM114-Status: UNSURE (   6.08  )
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

Please drop this series; both patches are wrong.

1/2 is mis-attributed: codec_vp9_flush_output() is the .drain handler and is
only followed by teardown (codec_vp9_stop), never a resume, so the "dangling
pointer on resume" path doesn't exist. The real stale-prev_frame deref is on
the source-change resume path, not flush.

2/2 fixes a real NULL deref but in the wrong place: the early return also skips
the current-frame MV-write register setup (HEVC_MPRED_MV_WR_START_ADDR /
HEVC_MPRED_MV_WPTR), leaving the hardware to DMA-write to a stale address.
Sashiko's review is correct. The right fix guards only the prev_frame reads
while keeping the cur_frame writes; I'll send that separately once tested.

The rm_noshow_frame() use-after-free ([PATCH v2] on the list) is independent
and unaffected.

Doruk

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
