Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912B4C38147
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYuNzrUz4RryfBHsza++InjHVgBMi+2Y1kQ5B8TV7Yo=; b=SMGtRO9/EMT2rB
	Pl2Qz77w2hmuKg0tK+TMisbsSWM+GtXNuLwIupvuNegRGnG2FOtCGD+hIdvcZpUTUbglg8RtlipgV
	Gf1sxkeuqhxDcFZy6KO7ycn0jLdFAsE0iBYcz2ee+PdHaWvYfHQxRfiTsBilF6forvYFBUqaiwsnG
	HuRmqFhT1rpo5TtBMYrhXxnnevENHwpuMcO27zimH4rQXbBVR8WiqQcZyD3LtKKfr8rck0ol2ZdZP
	eQ+/pkiDVSC0Kinngdb6DAD/urOVfAy+eyhD9lpVGiprYmk+X+y1FkHUlO0gGiWSxbOIzuljinMk3
	r/zGAYajUKvaivVjWbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIC8f-0020R9-20; Wed, 18 Jan 2023 17:22:17 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIC8b-0020QB-TG
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 17:22:15 +0000
Received: by mail-il1-x12d.google.com with SMTP id v6so7826153ilq.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHkgikre77EHT3/g6r0NFQCicXfNDncfTKLPLwU0O5Q=;
        b=mQVPzVOy2HAK3snoqJ5SuOs+TGigKX0JzcM1I1ffephUlCut6a4watbrK58DAtqW+O
         P2HRiFijPyWn9GdB6MvCLt9VxuyXmA/G1XQkqssjC+2RJwT2f8A6EGONwN81bkZx5bmp
         +zQylD+L4yXp6WDODprc2dRr9Q2DFYgySgNMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHkgikre77EHT3/g6r0NFQCicXfNDncfTKLPLwU0O5Q=;
        b=jtwFhS0IGFm3PolXvWJfNISenLq9axTv0AjDyvGsM40xjuZ4f8/OG0ep2XHOAuNNkl
         +uQxSe1he6XHRckMWdtQdHEmzRtSAGMeyGZ+6F41qKI3A8HveeN3a01/hgUQq4qr07wp
         guG+LWgtm+nAZTlZ658X15Qkn45pOTh2pnSEUl4pG62T4xLhVwUnBLRiM9IQX8oLPRbj
         42p+BV1hIkw7hJGYvvDGhUuN8nf6yDQTH/LBxqyf90e0NTOTDc7INcU0GfmvfA6MA6fs
         qVQ3dgIAZrJ7CWGOG4cCdiQmaAXM7FbuxtH8j6zelWh6Ioj+XpfaCMVWKS7NK1OGEo3K
         fXKQ==
X-Gm-Message-State: AFqh2kqRzrQqwWNEiPGjZYNfeE7hPmx3yL1LHCGDRb+2Wavmd/zA9kwJ
	hB2rSC5jog2wIAlfvLRwRYiD5w==
X-Google-Smtp-Source: AMrXdXtMjhW5fHNPeVRbpUj2TtE21JZN3FT5gzC4TId5LfCuRZEk9efrLRfrVPrpMeR7hh+KOEpAZQ==
X-Received: by 2002:a05:6e02:1d86:b0:30d:c671:48c5 with SMTP id h6-20020a056e021d8600b0030dc67148c5mr8273983ila.16.1674062531845;
        Wed, 18 Jan 2023 09:22:11 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id z1-20020a027a41000000b003760a908bfasm10644139jad.169.2023.01.18.09.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 09:22:11 -0800 (PST)
Date: Wed, 18 Jan 2023 17:22:11 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] usb: misc: onboard_usb_hub: add VIA LAB VL817 hub
 support
Message-ID: <Y8gqw3G0z25zG69K@google.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-9-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118044418.875-9-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_092213_963770_F149EDF0 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, Jan 18, 2023 at 04:44:16AM +0000, Anand Moon wrote:
> VIA LAB VL817 is a 4-port USB 3.1 hub and USB 2.0 root hub
> that has a reset pin to toggle and a 5.0V core supply exported
> though an integrated LDO is available for powering it.
> 
> Add the support for this hub, for controlling the reset pin and
> the core power supply.
> 
> Add USB device id's for USB 2.0 and USB 3.0 root hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
