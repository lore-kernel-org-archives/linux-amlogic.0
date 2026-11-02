Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50B606EEA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j6/AdGHE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LGKy1CI9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jHYzZl0z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DbcE8dZrtsyftTLmynFRTLgBGt0Y1ph1thE2eCzwmM4=; b=j6/AdGHEyXub7o7h084YUtuwB3
	TSf08ztszgXWyxt31NCBgt5WwpgmI/FB3r7GOvCcBCKRVcMHD9Nhq0G3vbkW7eBDJ0z5kfEp1huvi
	zvTYxk/ShCg/l9QeU2AUEmIUcyY8aNX830tzl9OU89fA93bwI6bcljbvH4kw+/RLvalBgz0Rxo/3B
	SKh9HAg2/IHwi2wg1095/OhWRrdZlj14oSj8S3Y7eLkcOtSCw628qGZsmMxxySxiSqFuzdsXT23Kk
	+zne+ogGZL97fd3ecRMEqGIVIKstxZ0iKhuvh5zpI54dCZtTrmydo06MTNm1R4fG6rVqlb5Uxyl/j
	oqaBMnng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtm6-0000000H2Ao-3Zn7;
	Mon, 02 Nov 2026 15:16:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtm6-0000000H29h-0Kqx
	for linux-amlogic@bombadil.infradead.org;
	Mon, 02 Nov 2026 15:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=; b=LGKy1CI9l2GzNuKcYR7krmte85
	Od3AMfVkYrWSICOqosLhWm70qS6LQJXLSH9QkmBsQEiwzqkc0ZejYbdohxgSDfYo76VrbcTSfz2ch
	ujrjICAH+8OZg+EwGagFXQRRN6BSJ89Mzg9pxmr3m5SvUeypzN3KlmronbcaRpvYaLdiXjZHLCh4s
	pKtnR5Qh+aBKMQnlp51L7BZ+SmcanLNjivlwv+MKXKg0FseCDVy+s9nEG2PN/FcIxAs5atkBPevZl
	6jj1HZ7XVr2uOIS96L1RX4Lbq1YBPRJFy4Cq/mK94TrsSWdRa+Z0wsCWI9OrRrbvl2mwTv6eXruXW
	7COnm+qg==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtm0-00000002iTE-1Nh0
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 15:16:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23669705e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Nov 2026 07:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793632592; x=1794237392; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=jHYzZl0zL8feWT8MztsCKTpvVK+jguvlN5SPRHZI3YYHqKer1cdeNpO7/obA+lIaJE
         pw5zlvB0dPljSwMkGU+hCInkBeJPCk+39Ac6ZTBpFn8PfBIIzXlgNl2UmemIyMoYbwPG
         w8tUmoYU5h5b+nymrtEcSX4W5iDfyR+stIHxBJAX5+v6kVPp8HeX1dBuLZ/IVAYdNuTj
         dgJ72qTgtq/RLv8xcTgaUMIyo2094/Lk3kVURhCyld5vPHD4htEtcQ1q5HK64sDpyWRQ
         6mqvlUnbcy7AVWCf/R6DWRniT6tD0fVW0c2IEnRL2fs5L4n05OrCxcgRbzH1lWr1VMd9
         GEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632592; x=1794237392;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lhp5lP3IR5uF75os6lL1lZTm+qOi+cJScoaRZnhdVA=;
        b=0GI+Nynu8GrchxErcUKb4LD2icwdkYvVqH4Hfnw8T3bXxQG3UD7ah/HhvggJLcIG+a
         B9cHHjKE4RszsJCvEXVWVQHA4rMxGvSXvRf32JJQ349fJAigpitXMiRXIcJGBFQW355h
         dnbS0k96vNTurIbNxQISSZLo4yA9HUZUktdGgNVNY2LD1NaLcazWFXl8XpfkkJIBB0lm
         /pXc1Lx1JfnrQ6emmvQmlKjcVexJT5NlVJ5gK4SdY31CPpvYPPowd4v+NCtGBQY+hbW4
         Tq9ZDs4DDMGrejzzbyMsSDBEcIR7/xlCxajSpyRI5wNK95nxi7gVCCcI3YgasfRcY5rK
         6Aqw==
X-Gm-Message-State: AFq9FYJOqMu3wC/a2y/3rR3letmzDBQ5BOmwIqTnNBlE3aKnlg/lxSa7
	4suFS8uHNlzK8IwumBmYPfrrnS+c3z5TsLRrKMIPxsD3c8LhPWCgfwmQmbnXu0RrOwc=
X-Gm-Gg: AYBFou1kliMiNhDxtzYLHQoDxaUCJJnfr9iJymYP+08SUAHGjYbk076W7yVg38b4GWS
	1bbwzbqQ1z/Y/CoyHOScHPvMYXWyW/pDSIJfzppstzJL7ftGpD43q64utAtJyC2vxFgJlFSWkQd
	73IHxpDzJw1XPQis8L6Eb4QNpL9Atp/kHlRgiBrliBSsWtynASHdOBdB1944ewjxdxJr66hAHLI
	9tBY3BQFmbp4x3kIPEt6n5nYFDmqdfM/zbGbsgUQ9UnZoUMWC0/pgX5+bRAHiKcZb8lAuq/vgfJ
	Bhk6xIYiPsI9+IWRh/46UotScuzZtIV8CaxZee/I+RYzvNcwihg7BjGC2Qqcjx75v2sAo1Yvj84
	c8Q4b8xRDSBQbGCsQDbKGTYhFMqxhmdcR899W3h0XWBnAzdr6i7JMK8LAlE7VtrokkDuZQIWN0T
	7LgbaY5+3iGz076/y9JsfqkL6QpCk70JgdPXYShB/bNaQ+D98pnMCUzS83551YY6dXSCCtAVBAc
	mt++3To4668WVvNfwHqxzIz9XxPgBK8aw96bP5VJ3/7wHdjoLCxP4EX3KaVLbNRTSPBqsfD4WEZ
	QX+lyWHIRKeb4Zc+aOS2mygyswoWhwfphIhyDd7jEC7FBYeM/bm/opwuTb4BOq03JsT91Q==
X-Received: by 2002:a05:600c:a107:b0:4af:e04f:cbaa with SMTP id 5b1f17b1804b1-4afe04fcd89mr78414005e9.29.1793632591746;
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm523955975e9.15.2026.11.02.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
Message-Id: <179363258546.2870673.13247205665671196595.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:16:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QkKO+7KRF9p6IxoBwO0rqMIDnmIJ+8dF2oqr4paee6Y=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvVvptqUrhvGV14pzz059soU2xjl9zPhutmLT11fbZy
 Rdu3fvJ2lHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJBKQw/JXjWX1Y2/5yktTy
 RsZfjaFa/tMeetoHxe05W5qwJelVlyXDP6VY+cVbpzBzXLlkmeSpanBhNmtS3yrpktO/+A6Vftf
 /ygkA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151637_098689_21A6CEFE 
X-CRM114-Status: UNSURE (   5.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: gxbb: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/17b53ee5a743
[2/3] clk: meson: g12a: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/8fb4c1084cb9
[3/3] clk: meson: s4: fix ENCP clock selection
      https://git.kernel.org/clk/linux/c/7c328cc402a8

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
