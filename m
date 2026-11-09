Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC3606A321
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MtacONgt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kdK1LuBo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mWIgOm4voOsuQFQCDv7ObVBKzHCmEcU33UCCI7I0tHA=; b=MtacONgtFdkOSehoM1Q8zk8wpi
	zMwLT5uV9tIgHuVDEN962JNz+9GVj7eX/RLrM7EEa5NwVc5a1BBpvMNN3mu7YEspNiYEdnhVplb59
	xX+hdUNydbZ8E3cqvHqI19OQ4X07WfRc9JlldUrR03/+77Z+rjWBpPQZpvvlTUvBIc0Zn1bqcBQ8S
	GAXtBbSjPjen1jr7hZ1F2ag6UJCOG3LXTsSq/XZtS4132aAkHJgO+Nd3GpdCvJ1/0e1GZNU9nS/rJ
	Lk3whuVRxQ2KtbCl+Tj8bXw6oWlz1dedhCJTO9YqC/ojRieBGezOTIKFE5IAC2QOqcLzfaamzlUNn
	0rDrsBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKea-000000002jN-3rfH;
	Mon, 09 Nov 2026 08:23:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKeX-000000002iF-3b3Q
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 08:22:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so4691765e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 00:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794212575; x=1794817375; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=kdK1LuBoJEIkPFFuZVhmMtL2hl67TLwowXmkK8eMMEDYqtHQHjPMTZz6hjZu5nOgvO
         7jT9IJQPaafKIL6EfecJKxRw+MIbeMSaTXitRYJXMI14DZ86pxZQRcgXeZ5GiPIK2Em0
         L0U08SK252pKHfqSMlWVKPV8o2JdmwJ55O3R+MkOQAR1STum55EfbxQbbpOfW9UiRqYR
         Gza8HUU6ELTt2YG7KjY2uI6EesovvDjdbzlTMvu9IFChCa92+laEq9XCX2LP0fVwe088
         NM21EIJxWlUu31JkHnM1Ohpcr/RDnr39S6aINYfSN/JPDTxeSc6WnrS5VDXBDoMuIrBa
         2q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212575; x=1794817375;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxG/u4u9BGu7G5Ao9Bh0a6rRDz42atbNH5H/yOM96FE=;
        b=qpYWiiQcXmgY5dp9AnTBfYXb9tRFBU8yeoSAdGNZQq13KKSxuTltxQr3uGdlcOjh7l
         fRKoKSrbb8UwnnINOIX9txwGSp362sWjrm0J5DTn+ReDPS11glZjX4stUIJInHOH+BDh
         IRGt0ibe83+7EG9Wxp4qkwi9GhLi47Qsl7UYwW1fERdNd875AfBa/QUH/AELHnwMf0Bz
         7bAPWdZrjbtI3mdF4aZMtHtukafm16uCksfCMdq7zZUb2a9jX1rKoflTrgxbpEBETMUj
         jL4uo/+q3qRBhFikNoXDg9BYh0VtHeWMPazDp+nfZ/DoicGDheA8agr6NbjtuItEuU2W
         lE0Q==
X-Forwarded-Encrypted: i=1; AL+hErH/TUYHd8UIaeTJcsblw2t/541KwFHP3krMrcZ6tRuqK5Jf1092YH+20ueZx8Jls3Dmx8g7m73Ku9IQPKZX@lists.infradead.org
X-Gm-Message-State: APuU4Z8G/59RvR7DU15YhvNyN4Xuxwr2cczXxOill6VBALBx7oxicTGa
	4kB6XZUF3xSSZMysT76TWtE8GXWvSE7Ej/JkWAsNCpGsN7aDa+1LrSARanwGbBQ6pORaAuMv7zP
	D9dIuEjk=
X-Gm-Gg: AYBFou1jHNFG5FevfGHW7MzksVicJcQj/m9owI2qsDdPxsMegfUnbv24nE6M0P+VB5W
	xlRXgIbj52mRuIqLArDcABgkwsAdOTXb4xyQD08ByDGZHzwH/B+cwwgCC/wTQSf3tg9aGjj5Z3a
	bcKWvBqKtR4qxADopZVkc8BoJgd7LuLjKZxf/fa7nEkcM44SY7QlF1QAl5htk0pMXMh27F2GEsL
	wdlPaIjq+glNOTvav54ERvOGHfukYjJVw46DYyw4qF2+NiiDj1sshmhhbJNQ46BfWUoJHOC8iQY
	P9Qe7+l4xgQuwRerEr674knLmYvxxXdjRMNgzMT32CVRCHREQLe+HAG0mV6M2vztSvU2jEJ9rzm
	V1mFNAEttmT5m6W+plLGbdSEs+FjEaszoMX72njdpKbM/0Ffmr/G9IjPE6s9jYhuciljBuz1U75
	Abx5rJvQSJO6hl2JWYlid6BmppTASniqiQy04lKQFKsGJdeL1p4+AkCFpus9y2qz5ppEeydPqlV
	bmpCIuTYm5e26f/HkRwcPLUu1aG6mg1KKpPHWzHMfwSATKc3IMaNvwnDPqb+LOz2aFFugG1RHOm
	klH9DLlZ7QKg8KTjXkyJOVdBeRE=
X-Received: by 2002:a05:600c:1c23:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4b960da4ad3mr74504955e9.5.1794212575442;
        Mon, 09 Nov 2026 00:22:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f1117fasm139701265e9.13.2026.11.09.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:22:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
From: Valerio Setti <vsetti@baylibre.com>
To: Jude Gyimah <jude.gyimah87@gmail.com>
Cc: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.com, neil.armstrong@linaro.org, 
 khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
Date: Mon, 09 Nov 2026 09:22:49 +0100
Message-Id: <179421256915.10992.15316919043567627727.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=502; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=N6o2biIKf/6AqsgDmShn74SQm8T8RQuwU2MQPtShIl8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkfm27vnJKjU7tJrMtO/JTW7R3vjztV9PvXdLJdz0vgi
 7l76NTmjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEyk8QbDf/9y36b1mSGnD2qF
 cz/nW+su0sFV6up2+uSmkEVTsmLTPzMyXK6okvrTo34y7vq6ezOrj8iF6VfY8HHHl3BErQ31aPH
 gAAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_002257_910268_17F38115 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 07 Nov 2026 17:55:23 +0100, Jude Gyimah <jude.gyimah87@gmail.com> wrote:
> ASoC: meson: fix missing REGMAP_MMIO dependencies
> 
> Each of these drivers can be built into vmlinux while the code
> providing a symbol it calls is a module, which fails to link.  The
> same shape in 4 drivers, so they are here as one series.
> 
> Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.
> 
> [...]

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
