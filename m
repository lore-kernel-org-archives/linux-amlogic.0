Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CDD606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WtzxKvUP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qIGIuQd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ywXvRqSWZrtgbYkvFPT7Rr2j9B5d9Ne7gHRiaxpzZcs=; b=WtzxKvUPMKcKIHwHx9/qDA9jdJ
	6TQzSlYpfcCVTrWq2F0yjE/Z3+Nnc8eXMfacf0IQ6izNssDqQmzvd9a1jp2l+dhoyUTvN6Ph5sXXB
	tPzgIDtCq+gu/VNotu4swkw8ndhOevfOSOwR9omuAMCrUk8xJnKXKY2MqgWSOcw5RBWqzgIUuqnEi
	73KbQmQNGlKgct1OwrzoHhwq/AfTRoLGCe5Jzykg8seQc8wwvBbFDc016H7jppnYLvO/pwMCW6SbH
	jA2T63X4ouya17Fr6cCrgTtHvGKgMLWMkeUxes8XY9NtFklYTQUzScUfLpjpqYKcZEN/8XDpm/ZxU
	teUYRqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGYY-000000020Ar-2pPZ;
	Mon, 26 Oct 2026 08:59:50 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGYV-000000020A2-3U6M
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:59:48 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-33fb4680717so4956405eec.1
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005187; x=1793609987; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=qIGIuQd3J+S0ne3NAd/RPOiym/n1zrup2Lc87fhn7xm0gML6T61C1AmGoPG44a30+R
         rq9UJqRBc6Htz7g4MsMWWArrdGU4Ub189Fc1UH0q9y6zUHPW7Z50n5iIPAijqg+9IaiQ
         AvekuLYbl5dwzMJ2/H74Hv11uDWRUflvoe4+h8dTr+5JPAaPtDnnb+BJiS5Gq/Y797UX
         zrqXYbruScNVb3fpT3vgPCVaFrcqkzORHP8xfw3lEGE6ODTkjVVdapzuWoGa3360i8Lp
         aV1iCuOTYC4imHnbVZXO7NUEUyDI02awKBnWofKBjJ+Q77AikKSfgyRNlrI14u+1b9aU
         zaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005187; x=1793609987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=DF/wGMzZ6b+xxdFrIzoXzOWzD2Okk/Fhoe/AcafMjZFyOiIUvaLPM0LRh1RbCPA72Q
         VRA4l+3HFEtitWMCKGj1UGJnkcRiZf8c81ppexiC0ICZfWzcCe73RsQkhvmD6V6AQM6C
         dlcaCPRa/vmC/lyuTdyfVawrlxHAfjg9E+MGRIg5eiIjq4UH2yMbFenPb/Jo9Hc4hazg
         Zu/WxibkFJ58cpINcg1KCJEVED4o36Dl/LQwwDiysNRvX7SmGGJOqPeIlI+7kwG0/vmm
         jOJztpPbzylFeGKCxkAhmUpDaOLFgMI6QAQ7QQSYd2s+FYpPkCcU/WFCIPOqeLfzea9V
         j39w==
X-Forwarded-Encrypted: i=1; AKwUvBwi8/N0wBkA7R1ibgy4GDyimJ3hjiLnEQ8I0AufuLcpfP55ym3wCbJ4PqUem90j0Ahvoj72VNlJYVy9Jnlz@lists.infradead.org
X-Gm-Message-State: AFq9FYKotQAp6u8sd8FW1eS/wxAtq5MQ0GbhOiEZ7vvs3akJJrfoD0ka
	AeAcVp17z3vhRcfEcN75YkVP62wkWWM20LmszcTP7hJVScB+RWEAHL+afeBhwcsX4yo=
X-Gm-Gg: AYBFou3mow8EpHRiYoyITFyeyc1hwJUaFA9V+6NQG2SHLb2H4QlcZDEOX8zloA1Vn2r
	Unyw2Pi7ep4wdPLAEL9A2Iu9d3Ab0a24tdrwEWBg4ZGi5eeSiCwjrGHU62Q2GO12VWMbvEhA54b
	2nEOjMc72j3TkU1F1p37SNStBk89uEu9mDiOEhZktMNYxz5DmugOhbPo+sIj7Qx3guVnnyuGDCj
	ZiAy8MgTgc0WI7KaE1mVLN4ju5uP9Ix40US0IlNFUwHid+nPPC8HRhLow4B94N2XU5n+aW2GR5T
	A3ylM55xDJ8I/seG7sUDmDLAhQ/xmdfkDuW8ISIpoii5JxkxlJ47GSAWhM54IMZ2UjjJ9NuEi2D
	ZDWsmyTjJ7dngVNGoVlMZTMbq3gkQqv5i3h4OKEAWxzxW29XqGldzLDVzeX7RQ46w69WrkppKJL
	vXaGEJ9SmnYeNqfSSKGjXtoUPR/b+G+QKiqmA8BxMxyZdo2imzpVLN7LB8V0jYO0hi3ksTAm256
	h8Utw9MvGOsYMXj0HQKXl9VFZ5JwYyyCETFJ7z8SXfjVw0gsVJb63W09w==
X-Received: by 2002:a05:693c:6017:b0:369:21a:dcca with SMTP id 5a478bee46e88-369e848a2d5mr8835197eec.10.1793005186447;
        Mon, 26 Oct 2026 01:59:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm4608834eec.6.2026.10.26.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:59:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:29:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
	sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_015947_863191_678AE1B0 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-10-26, 09:57, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wro=
te:
> =

> > On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> >> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> >> =

> >> Every S4 speed bin runs the same CPU frequencies but needs its own
> >> voltage curve, and the bin can only be read through the secure monitor.
> >> =

> >> Read the bin from the firmware, select the matching
> >> "opp-microvolt-speed<bin>" property for all CPUs, then register
> >> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> >> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> >> on the SoC compatible and needs no node of its own, and S4 is added to
> >> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> >> the bin has been applied.
> >> =

> >> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> >> ---
> >>  MAINTAINERS                          |   1 +
> >>  drivers/cpufreq/Kconfig.arm          |  14 ++
> >>  drivers/cpufreq/Makefile             |   1 +
> >>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
> >>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
> >>  5 files changed, 202 insertions(+)
> >>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
> >
> > Is it safe to apply just this one ? I can take this via the PM tree the=
n.
> =

> I would advise to wait a little for Amlogic to chime in.

Sure, I wasn't going to wait for the maintainers to respond anyway.

-- =

viresh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
