Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC66DC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 20:05:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9612360FC0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 20:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9612360FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HG0GQ/yt7B63ALWhb1+kPih9SQlhgw7BjpaDByhd/ik=; b=MuiX4IPke5ybtZ
	kV3vhNQP8wx8MS7lTQcoWd5+LAX3dnkfCLVJCXEPTXfxxNd+jC98qld31kZKFEzbsnEPxcUzAErmZ
	0Kig11WKH3x1xwwhW6JZ1zPM6keKLQuWxhuGu2TjPtNuNIcpDElzcqCS6LJvBnO677bnxF9o9BG2Z
	QbPHUj15m/y1503817PTJjIOS5aVo3S3qBB62faZXp2XyORO+bhuzQOcP6jEU+J0bjPTaZjnkwjkf
	/um1kgXqTUrYqVTCfW/O7SIgiswsi9ddzsetfAvpwG7i4F2awGq4JnKKvnQD4o46QE1gEVRGH8RrB
	OrzPIfMV0sPDjsOMCxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUwrw-0046f6-2n; Mon, 27 Sep 2021 20:04:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUwrt-0046dr-1i; Mon, 27 Sep 2021 20:04:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x7so59260743edd.6;
 Mon, 27 Sep 2021 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OX8yMzkk8iAoqm3EQC246sTeS8KMkAo8I3fGOIEk0o=;
 b=jeaxrflHDslabpblAoWGyJ9CMxArRIOiQ6AgggHNG/E4JAzrSKTRDtxDKupBhU8Gnb
 0EynIxCVGMXGy3RDx+gtNIuyGHfxNFZJMiistP250SzoxdgpfgtSJPxeEceuz+CDWJEc
 CFx3lBQ0/esx6ft3FLZ2cIA9KpuAOAC/a0u178ZpC6XK0AD1HtB7mnoi+vxaNi0KpYnj
 LLQ/AyIaUvj1u4j4Sl0/dtNoBiCRQ55wkJS/FZltVCVZ5dQmFU7n89ePggRQ2jnPvQQM
 4xaMRaYLxapDhBG89Fudyd7F+FnbZMD7+5S/aNrTazb+TKbdUuZKILc39k9fD6f4CVqZ
 i0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OX8yMzkk8iAoqm3EQC246sTeS8KMkAo8I3fGOIEk0o=;
 b=heYsYI+5gzL8U7JHpRTfRof+RBUP9pKv5edOxQ9tvyWvilTqJJTqOCqz8XVSS0usgH
 8qXfiUngFQcWIrS3AcVi1O4nnK5+frZl57vyAD+2dJxEV/B1HyPwgo4aYb1TqbMNEqRE
 5e0d2cr5uYIxakWWhWmfdDQdH9vBRymMP8Q23bbzNEpMHKUQiDRq27U4LAkaGw1gLq8R
 a1lOQwE9llOFPjA0aovvGPtFK/6u6qQJ9lzIlONItY59jp9qaKiCvVseC1og1uYMVPyZ
 T8hQwKO9CbfgGdrlxi1ea33DNYeQ+fP1j5wsXLcR+Lhl+sMJ4OHIHvRzJA8nJMvCxM6c
 mGTA==
X-Gm-Message-State: AOAM531ErwJXyiGPcTL0bBQA8795uf9FKyhv3/sGMF8brtMBsPIRNU3U
 0Ie1ZYDVzD/6119V53ltTedn92G0mJJOM1cZLHQ=
X-Google-Smtp-Source: ABdhPJzuMhBwzbGpSC0BWzXQTXJ6xTuHcG+6DyWu4ypgvTPZ/5SFkk+EkuN8imBZmoAGRbFBIvfwepGqbgLbw0upOrQ=
X-Received: by 2002:a17:906:318f:: with SMTP id
 15mr2225309ejy.206.1632773090226; 
 Mon, 27 Sep 2021 13:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
 <20210921192557.1610709-3-martin.blumenstingl@googlemail.com>
 <20210927161955.GA2837840@p14s>
In-Reply-To: <20210927161955.GA2837840@p14s>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Sep 2021 22:04:39 +0200
Message-ID: <CAFBinCBBoCONAkT97nspipbbkwgLU2RjeQa5rz-MKiwyKoKAqA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bjorn.andersson@linaro.org, ohad@wizery.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_130453_137701_B5D9A335 
X-CRM114-Status: UNSURE (   8.45  )
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

Hi Mathieu,

On Mon, Sep 27, 2021 at 6:20 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
[...]
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/property.h>
>
> I moved this just above platform_device.h and applied this set.
I missed that part - thanks for fixing this up and applying the other
patch as well!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
