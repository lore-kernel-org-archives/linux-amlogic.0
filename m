Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7272C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 05:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUzH2OJ8i052Kf/biNV+dbeJdp5U/xMDMbQC7n47VXM=; b=Uc5f/xS3CHdLXv
	WlhSOx+6EUbWU/vHHgr+/LmxiS291b0Om+8AEesU+9emCDJxcxwWVDFvkfhKqWfBXz72CqwbxO01A
	CFEW4nAIseX0o9/c30jVMKBKE3NuhHGUdp9fCBA4xL48NcoLzxowUK2NLILraYl4pFCRiDAXxEpeu
	19xXuJ6xnLWW9f59FNbWSPlvj96bGKNmIXZm8606CvBaD+S/EKooWhnP97bRwe8fNOeeka9pOXHL0
	KKXsbtza1iX9Tp8iZ+sw7mcHo8EJSCJALk+pPon1G/zSbeSxGECwxE2UKl3nsZ1FMktldWMBlBFmp
	R+wGYK5onj6R0dVKtUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGCy2-007vSa-RY; Tue, 26 Jul 2022 05:18:51 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGCy0-007vMJ-QQ; Tue, 26 Jul 2022 05:18:50 +0000
Received: by mail-yb1-xb33.google.com with SMTP id f73so23598365yba.10;
        Mon, 25 Jul 2022 22:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6q7692tRTcvxlctWBLa2EQMxtAdhfY0jiQAAp5IstQM=;
        b=ToskS5StynEYtsUReY+Ec7C5qMGMci+PufEwwOQUYBaBTeSSo5BpfHFPOR7FrBaV37
         2I1Yv1AqhVvaxmYQlRrR4193CzR9WIpWgjaYIgpRNPIJSxRnZG83DnxTpudqMYfiahEv
         OE1iNtgwaCkoVhva6n0N/IMlmxGvmY93dubgQb0yoytlniDBOsjr/ZiUjq04v4UdDAhv
         d63k78D52fwFxRJp9JHWhdNRk5rC28Q1c1mXtmPhJd0Zni2NIlbJ9W72dpBBBR7nwnxf
         V/kohW37YcYPCBvE9GniWFIs58PO9sZmwaS9/PuPCFugWUZSwdlvtXWsU6Bg8l9EYyqy
         GQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6q7692tRTcvxlctWBLa2EQMxtAdhfY0jiQAAp5IstQM=;
        b=uKje/360CXbrShxFQyojkNqvFv1WYN4ql6EIMQI/8uQh5yTAleHu5gUgxJA9OpHA2b
         uP4QIEyHLzZ1m6OxLTeHt96NrLpzXTu1VPHm6qS87DuuzBR8H16l08PkCe9GchzBJwlw
         IKFnk68+ZdxBdUCl9TaJdqgn9Ezv0nmarpxsqJEd+mIrFDR9oHXGYMzjgDR+jhEPwQXT
         6mZvQ0TxyGoKTVBnIGSVHtxFPXGXPpRNsQErpPd3k6zL8XQOAf2p7S2ijPSnvLSEbzW/
         fE31smRXj74l41UIpDCGsL0eTBlsxFCyAkic8ee2Ff+QNwiNXprAbuzy99fU1uQcEhGg
         GY3A==
X-Gm-Message-State: AJIora8WXMguvbnvGZbOSrJD+7GwPdxuA9BxlYcNKYPgrAR66BSFwrsB
	ORG6I3JQsa47SoIs+3H4JJsN7DFgEu6ZsY6dhDE=
X-Google-Smtp-Source: AGRyM1v30EAdPG+A0F3vatNSXI/6ddQM0dTUWWbnA0DK4SjIqiYF4u78c4GkZh+SSLynnq0MX9B1srKy6J6Q6jysSZU=
X-Received: by 2002:a05:6902:114d:b0:66d:9fa6:4bd4 with SMTP id
 p13-20020a056902114d00b0066d9fa64bd4mr11317252ybu.362.1658812724555; Mon, 25
 Jul 2022 22:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220705022032.281665-1-windhl@126.com> <CAFBinCC1x-655H2LbbUhiVGmgXL+tdSRnCPV0a-NJcZKOFJZuw@mail.gmail.com>
 <40b3ed24.b4d.1823814761a.Coremail.windhl@126.com>
In-Reply-To: <40b3ed24.b4d.1823814761a.Coremail.windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 26 Jul 2022 07:18:33 +0200
Message-ID: <CAFBinCCzOt1s5ExH5H-BzmJbFLAzMZgkTvBt+vCuRBbL_1QQOg@mail.gmail.com>
Subject: Re: Re: [PATCH] soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()
To: Liang He <windhl@126.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, jbrunet@baylibre.com, 
	inux-amlogic@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_221848_894596_975B3283 
X-CRM114-Status: UNSURE (   8.38  )
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

Hi Liang,

On Tue, Jul 26, 2022 at 3:18 AM Liang He <windhl@126.com> wrote:
[...]
> I notice the declarations keep the reverse Christmas tree order,
> should I keep that order as the  'parent_np' will become longer than 'np'.
Good catch!
Personally I would move parent_np up (above pwrc) to keep the reverse
Christmas tree ordering, even for new variables.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
