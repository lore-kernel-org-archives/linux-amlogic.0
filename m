Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5552DC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC77E20678
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 09:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gt1GuLO5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXh6dz5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC77E20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FxsDujQHridYcf0+Nxsi7vbhTFnpOIvOrZ95ZnMbaZM=; b=Gt1GuLO5OyLPIbGe8e32xVNcD
	V9+3YzgtaThE/M6OqbSH53izjMNhOEcSjEQaq85oALy31xAjVPFWn6UcdUNnEWphqa0SszBJa/mXe
	EARBzfNZFvjU71TlO1tLW20NOG/dmMtY+zR7XCnoCq0Qv58I3XW7ZQaefNVlASCzYPu2iNLcFI8BM
	O+PvT0U+WYaH60d+SCpGLCGgaiC6RD5tHea9GI9uI4bm+U+aQrTWK6hsWEfrZyBkcTNhbcd3YLmWG
	BoZ2DYQrq6dk9JV/tpKlHImu5zQNORAiAWvZnKe52fwyWWZOnUZHgBglnhYGYP2sepXVUW24Ue7OZ
	VSs39TEaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHPT-0006X0-1n; Fri, 02 Oct 2020 09:31:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHPQ-0006Vg-Ov; Fri, 02 Oct 2020 09:31:25 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43A7320678;
 Fri,  2 Oct 2020 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601631082;
 bh=Op9qQOvRCmtTi/qrFC6hcZ02Bsccu0GIK+GbgVOdmMs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jXh6dz5s7lSBsGhcBoH/Nc5LUh9VJtwNaauWo9Ob9Qu2czr336t8xQZ9ddQYJgwPQ
 RaOSwo52NMRRYNY1yUymOVxtN2YDch2fUv9SI2FlVH45kP8nUj4EOB35WkwVW6kIZv
 fAeICjNWdsNesqlwYmwXvieguXIxvQdd9MdxoK7A=
Received: by mail-ed1-f50.google.com with SMTP id b12so955261edz.11;
 Fri, 02 Oct 2020 02:31:22 -0700 (PDT)
X-Gm-Message-State: AOAM532PYGQTQaJmrOCxIqRO6+dfqS8QGMVktSJPAdAyxUGWP9FQ4a1x
 UmEpPFwwt4/onEdQyOXe12SRWTuG4NfNAY72xpU=
X-Google-Smtp-Source: ABdhPJwSknSWj02zDQZ7UIOFFH5LS9ug09W2SVgWJOywobkymy1Z3ojVUQEOY7JssA67iKKNGFW+qhSE5EESCA8tfes=
X-Received: by 2002:a50:a452:: with SMTP id v18mr225060edb.143.1601631080807; 
 Fri, 02 Oct 2020 02:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 11:31:09 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
Message-ID: <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
To: Alexander Dahl <post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_053124_869492_04721A86 
X-CRM114-Status: GOOD (  12.42  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
>
> The example was adapted in the following ways:
>
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules

tweak? or align?

>
> License was discussed with the original author.

Since you relicense their work, you need an ack or signed off from
every author. You cannot just say "I discussed" and post it. That way
I could pretend (lie) I talked to Linus and try to relicense Linux to
BSD...

You need acks/SoB from Peter and Russel.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
