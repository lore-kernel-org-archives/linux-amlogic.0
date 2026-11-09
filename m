Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FC606D81C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sxhAiKS+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SMrygNrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QuIV3acRWiTs4KMo0CddZ5Ysya8eaNjx7dBlvZeAuTc=; b=sxhAiKS+kWd7v/EfVGyTZi5png
	2jbUQ7pfnJUepM39sbot+jkPWD0fBnu5d2XzJvz/TpZwAyiFMZMzLuYw+5N/SqES4KQ9nzbe8Ft1P
	IKVJ5YFXgi607+WBaNOp7/z/U6djUaGFNbEQ6KA1yZrPzAUBfBKy4KFKvQxeWMC3v+zbC0Hdos+lW
	R0ZA2x/SS1d6NajcyAuKQrS54Ug8k1yNFaRMhvz7giHr8M18IBauGXMFBJPMbpT+UpzvnEN9kWfPb
	NGTZfFhONeFL4kB1vY2yQzhiLBisfAIJ2a3FBAMIA3si6wKu/OdtDeCDs3rulnMpbbvOranPLYTDX
	rJsEXYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwX-00000000aDg-3M9B;
	Mon, 09 Nov 2026 11:53:45 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNwN-00000000a9P-13bV
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 11:53:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490d59c3edaso586129f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794225213; x=1794830013; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
        b=SMrygNrj19tfUpynqs9BeL/ToVRp7t6kycGATebrzdpREhRIphfHsDWg+l/MGnl4p3
         fyd0cNTqqoS4xd0QTKMw4JGQcEe5C7anTWKgLjK2xpXb8U4heDSrpNx8fL2bAOhOd+Sr
         jIdXPNnGTiguY85n6il/83TH3YaD7p6unNo6te4B7H3m9IOzUokrHQlkvLdNzUFg1g7D
         QiPAvYhgV0Gy9zlj/UmmIId6SmwqJHpssbR5tqvt72GqHHGE3AXOYm1SXG8kfaaovszA
         xRYBxwmm8OcdIW5eI7GUcQ7tAkCz/23wqr2I5keXZ+AJcKcX/lBfvYFz+Ss/38dXNq6B
         mhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225213; x=1794830013;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
        b=wZE8WPOZN5YMXqbkhc2O/G+iWm6CbA+Jum2mh1XJr3W4AiqvQKqf9tyqY4x2CiXwlj
         ogDMLc0lWbAfY1v0qZ9SJbXxqOXtIiVFDTLE5q5soBY2s3BCIM0TOeq3AxCh5uBWlc7Z
         rTfmkvlwRgbiHRe/aVVdOkLF02lwjQ91v2zE7U6nCAxrVtADOerrmwLzxpQ5XPARbyLF
         sGnjIOkRj8FojPgowrulCE+iV/fIeWTjnRQijjx2OJjSLA4Yp5aI1RA1u8wOpbm8028P
         KRWDeguRquIb7qP18o5JEc+PgpunBcRt7l3pJYlNQho+GoaVIdRKrRZX7S8MHmwQRwK3
         banQ==
X-Gm-Message-State: APuU4Z8wCiHGgz1kEESrjaydz3fppke1Ew0OYxe/GKSZpQ1smouhD2X6
	Zy/EgYL6xLdqCV0Qa0IZIVuzLu6CY4N46GEPtM0r2b9JsP40PVC5xtMFe9erhrQBs+Q=
X-Gm-Gg: AYBFou3ZQHmDA9XPPeSYtk3YTPd6DNP8ZzHfTA0/75GfoYpdBn2Blq2sl58uEjzWXx0
	buQSOD8M+M2QoPpSECNHnxQQIrDq2cj+8GSRkZ7rQW3lb8IpXbfoZJJPZmioPo/66cpT1QBgnzr
	rvtePiU06ggNTM+XqPjF47IT1T3lUqp6EJ90ZCxBDzTdBYKI5Hb51uy12LwC1CUS3uV+EdovdK7
	tyn/6AwZni9doJhlijkNNRpSlUz6OaLfpmcoQ9dPBhwT/RltETOLmD/wiyqZBD6UBuaU4sps8ry
	LLIR+z34QTnafP9Kx+i/9UlyZ9IKEsAVMI5G2A5+2jTovGRsebYTL5bpH+fbeOCMkap38V5Gv1B
	ad/DQBd3WaCWjCrRxWQANLa15S8AQeY+ByVauq3dhh7JLcAv4KWcPmz1htd9i6eRjDY/mmQIIwh
	uMdbmhZBBYo5ep+VKDFnvKG3Xu40Fc+w8N1hH14C1kG0996Bq2mzRCI6DkWom9Ko48SezNeZYho
	gWiin9LNf3XuNBlKeC8rQs40uZyqZ2lck1R+xKL9SBHH+okK6uRESc9fwMkszlTrowpYjd56DXV
	lGt3C/tepuRkg28vtgkO+8Daq7mj6baSosDby5xSM1s=
X-Received: by 2002:a05:6000:240f:b0:48d:f160:efad with SMTP id ffacd0b85a97d-49425566d13mr14507820f8f.30.1794225213002;
        Mon, 09 Nov 2026 03:53:33 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9527362f8f.26.2026.11.09.03.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:53:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de
In-Reply-To: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
References: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH re-send] drm/meson: add support for higher bandwidth
 HDMI DTDs
Message-Id: <179422521194.1645559.1387055395684042369.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:53:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_035335_325317_E70DF004 
X-CRM114-Status: UNSURE (   6.49  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Mon, 02 Nov 2026 22:28:43 +0100, Martin Blumenstingl wrote:
> There's a report from a user with a DELL U3415W monitor and a Khadas
> VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
> edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
>   DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
>                Hfront   80 Hsync  32 Hback   48 Hpol P
>                Vfront   28 Vsync  10 Vback    3 Vpol N
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: add support for higher bandwidth HDMI DTDs
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a5b5f29926498782f60441298e8a5442cd6a36cb

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
