Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2F0C982D0
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chQs4tNlbfZm89y0Gl6wKt/aMXevUp1mzgahKlcAhg8=; b=vVPyKk69TKkTGd
	T6HsSviGjd00rSCcdE3pieYMJw3eILrrZ8vNjvk+yR9cTKSlmaYUFu+sZB1LRz1vRjNEEPGh1tJRF
	wfc2pp9c/W8Mo5QyY4hzXuGqjVgTB2U76xz9yIBwKuUOkm7/ZSKAJI3rc0H1MVsmXgdd4oo4SQOVl
	aT0T2pVMkOsfoDrnpPalFEw5uUMIy3U3NHNPMi9553wrOrbm30tHIl+z6tibYRCkRu8VKaHB6scID
	zteHjqsNu80S5oUofT9+oc6OZ6ORQwYQdn6D+2Tpn77cTfZEPZWEXDvn1f98mLvXByGBwYYK2OMvu
	bViNZ5ww/vNN1pO/zBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DFo-0000000H858-2xbl;
	Sun, 20 Sep 2026 08:50:32 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DFm-0000000H845-0QwI
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 08:50:32 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e620fa473so11727595e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789894227; x=1790499027; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=;
        b=H1FBiuTcT1E4HXWgrY6yUjAZCidvYHuwvQ7E8Qha/nMVcILWAVtus2Sc++EAXVXpRk
         FaUvQhFpT764w7BuZEu+vqDF4FSoWhKETVvfxT/NkZwkcy43rEwlTYIY3Tffyow5n0wr
         xVmH84EMFqzaCr5asejakPfZgyed1xeaCcRU8XLp+3ZSlB7PQqn0exsHinH1nOj2aOi5
         8f6p8qQfT6CRbyBKj0LSAgF/l6yDUx71beQ0h33yNwfSsPJotj0yyOVmamsLeBGnsTDq
         vxcOcME2kSofLnb+1eWf9TnEQLP18ratsNWCF7m2vlxT2Tdw42nFM5ZdrKAXxOM7KKsx
         U7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894227; x=1790499027;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehp9Aplx73w0kxknx9H3QmiLQowjGYfxL4eGXjvfQCY=;
        b=dTP6JSyX6hSre7uSFKQHn44cm54IMpWbjx0d71cs6RDiMDaCsF/JBnfYc/ZpStVmnp
         3JHIi+ijwG1Pce3D6EunxMW5cEp/A4oEy046u1NoJj/asrGK93BbGlF0DdIK6R+KRN4g
         88bf8v0Hpkp/d+CjBFrIlltgKmaAfF+9dRELPS2YWDZy2Xb2eNmPF/57yWwlk73Jpp+t
         jSWsAyORU+iQ+ugz+3WwFvvCbHdrdHOzDBcoZop7zu5mGTaBuPh1q8sN5aGcP+TLsX1R
         MXMvFduftdSIoIgnMkXwhwHuZW6TlCe3ReEtgm8sR0EDxs3LXPdMrawJOlmXBpBe46Yc
         XshQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0iRheVgn6XY3jJGc1ZgEzHRI+wQ4eTRpwErCDXHW24aghdwxpJ6pphNocAPrnuk0Q41tZaJH/cC7X8FsW@lists.infradead.org
X-Gm-Message-State: AFuF++ns2DePKBbJK4Ffta55sRwemKlC6+yShsciVKRKZ9AFfxtj8hil
	BdkWXFbGnQkLY/YjQS7zT82cMvRKFlb/7pAE7KOVeIbYrL0rrojnI/2mG1ml7pmWfZw=
X-Gm-Gg: AYBFou0ft7O39aPctcFVWyqMOTz91bXBF3a8zulC6RbCpQLQ4MZwugxCwzvhL+gR9Gd
	iwixCxTPhMaSmNlg18HyRgf/EXyKxErbAAU9f9YPVxlcK7hK5TNIp4ESSHyNKKZNI2UO+vbDw4d
	4tL/Fz/z7Oum2TKAE0qgZQvWHxmfgiYYIIGpI3q7lkLQjxHZq56Y7ZDQRtA78/1ya2caLOvCaAU
	6Hrby99nTU12H5jz486A88tGiXxfCNufI4nNFwh3KwxfiZYhQ3QO+Bvh9jivS13BVMK+QXaqfLj
	1SwG4gsb7CgYZm2dkB0vS6sU8sFTEvpyrRmzpxGDksWzro+iUL2chfutCsdIqX5vOAaJ3min4wQ
	k5FswLhQLgkPoZrcIzGh7Xvf+6H6RBeBO6CjGmnW/g5qTnhcbeWV3m3LhWHuStVoYUvpwQwp02y
	lz/yChZSgjca584fpT4XQaqUudwtKBlsorNvv2AzftVQBgsoSnuvYJOG+JlDEy9BfVbDBVtCSpL
	5gtjquMlMzDIfUcIA==
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr130966755e9.13.1789894227775;
        Sun, 20 Sep 2026 01:50:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm67312145e9.2.2026.09.20.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:50:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
 <1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
 <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
 <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
 <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
 <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
 <c9c4945f-cdfc-4382-b8ca-71b69d91deb4@amlogic.com>
 <f518be12-9c96-4415-b442-4afcbc5b5d36@amlogic.com>
Date: Sun, 20 Sep 2026 10:50:12 +0200
Message-ID: <1jo6dscnnf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_015030_583647_03331E61 
X-CRM114-Status: UNSURE (   7.83  )
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

On dim. 20 sept. 2026 at 16:22, Jian Hu <jian.hu@amlogic.com> wrote:
>
> Regarding the suggestion to remove N from the DCO and make it a separate 
> prescaler,
>
> I have a local draft for this change. Would you like me to send it as a 
> follow-up patch,

an RFC would be great, yes

>
> or are you planning to address it?
>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
