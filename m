Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B166C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 666C6218D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QOUqJ2n/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RK2oq/2m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 666C6218D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riLnBeprK8X53wdTJAke8MYDBI1k7FIJ1mf9cS9JWEU=; b=QOUqJ2n/egW4Gx
	GfT+CYuFSMqd6xAV68AfUn3HLxfDxu4Kn75Imymf9/zL1ghr0il7LHoqf/J+Q8NjbTKgcNCPjmVI4
	74+zKyc1fH9amBR1eYDYLHwNdNCwz3QQBes859yd365TfpN7vklpsAPxYfcFqJnPwGaxU7DPCAhhR
	quyrbpdesn5UWbTw/7b8N5lPF7l4BynKV+P7Lpz8mm/YvoKrtEsYcRNOq1eRnFeyeRCx7a+BV5ut3
	PpjRQKCw6fxv5qeXgHbsJ7KV5vXFS7v1j1E0cheq9OW4oRhJtEB+NpLzQJBi7t/Hh2scAAzKFqIST
	Ow5hflZxW1VRAVr1JmaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ul0-0003ol-Op; Fri, 15 Mar 2019 21:52:50 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uky-0003o2-QF; Fri, 15 Mar 2019 21:52:49 +0000
Received: by mail-ot1-x341.google.com with SMTP id q24so9684862otk.0;
 Fri, 15 Mar 2019 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1WmB2OkuQotcGSTkifMaHZvWiPCi6moalFzp/XsjASE=;
 b=RK2oq/2mRorl3FIXezSTAvF8jdyRjJqKwA86Cm+hlZ4wW7+Kpum8YuJZ3GwjUj0wAs
 XhzD6BzEj66h5v5x8JZbFFDEB/d3ZMzFIG9nPpXMRnCVjSYuhUG5c0xfMYz3BlGGxoJm
 jAdTad8jUq2CSVWMuTmrGe5viNYsBs9nGdO0b4dgudXmpGH1nxKs7XvOn89tTxjTPMiD
 yvjGNC23piTrR8p8F2XkHVzI7cXz0lxUeZ/+JYY5RgDEknThfN+w7Le9y4BF74nesWr5
 1Wb+X9rZUmG/cMU6T51kZa4L6P/0JyHtIyBqcmfS2nGvbkSxLmyAa4k0VwjU2NJHwHCy
 jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1WmB2OkuQotcGSTkifMaHZvWiPCi6moalFzp/XsjASE=;
 b=H9i1BAmiETqr0S7Rdhe6L1OKiWc0gq+49EiEKIHcy9nkjdn3+h2Y7zALAqfNQFLPk0
 ulYQXZoaGX3f8xrWYvA/Ks6druO6+aMEm0bvkIzyxCySo56dzcVuOD/RhdNMbqEQ11fe
 3RHXOBvKULgZEgRGrRTCfeOxs0ryj/B0j3Us4Uv6IK9O7MibjfnFouzyoQbRjkmaZ9An
 aYVd4bRENjLCcF23MAF6O6jTQHv8+ChBTyTB5pEzqAjggG6/cp/IKfNnICnp+WfxoRlH
 kS7InPy2DqwyhCR4FpdGWSI3EOZ0epeigUV0ZB+G/7F7rbRw2umlJwmCxXARZnrDIVZ9
 SApA==
X-Gm-Message-State: APjAAAXLDC3eUl+126IfcDgseqNqi+OxUq8Xq/JHQh4x8xSie2pUVQG1
 dFcqZZP4og0w0QileOHjLO7Ge6MMzIpT7tXvKFA=
X-Google-Smtp-Source: APXvYqwbfSSdK/faD3hkOPxJ1zB+wXSq0fDj/DeIUWHqMBCq6n6xA2Enfr48FpZ6KC/Kr0hhwgiUP/ah9DYOnPNh4UY=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr3457660otk.86.1552686768062;
 Fri, 15 Mar 2019 14:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-11-narmstrong@baylibre.com>
In-Reply-To: <20190311095613.11371-11-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:52:37 +0100
Message-ID: <CAFBinCCRWV425Uon7BnR8+cFLO4T=bGXvSvkrnBWKvLYco6nwA@mail.gmail.com>
Subject: Re: [PATCH 10/11] arm64: dts: meson-g12a-u200: Enable USB
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_145248_850970_2B7C24DC 
X-CRM114-Status: UNSURE (   6.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 11, 2019 at 10:58 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable the USB2 OTG and USB3 Host ports on the S905D2 Reference Design.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I have no details on the U200 board (whether it has a micro USB OTG
port, etc.) but this looks sane so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
