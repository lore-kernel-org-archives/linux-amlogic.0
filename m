Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A955C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UP6bxnYHGoS6/SgJ6WqiSdUx2vMa/tIUNeCgTvY8bD4=; b=ihJz24YjcKARU4
	ghjRBGoc9iRFOLs/TM5orL2yi+Yykbcj/vfF6ecCf1ssnh/lSDyhYpaX1yaGkdjrqLGV+zj+q/9tp
	tjojXsyMbNFAr6JSOKizIPRS1wNfM/vuZEG7+dTI9ZNPLiDWLo/K2Ylbv2QN9SWGJLfM/9Sikt/g/
	FKhXbYffVmCjR+VH9DoRCRB6C82pNAUlgWqMSYZlmBoKA4q0ci5CNgYHOR/IyrRpnMEt3lc0WKulS
	ikNwpkwsJ7YdB7FALDl50aXZHtft67bUY8eYP66renaBwbnk1UZIl6ar9BVV1WvWqK22Yqkv1G6Jn
	Smg295VUGs4EUEVzvOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Jzx-006Ed8-NF; Fri, 31 Dec 2021 15:39:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Jzv-006Ebm-0F; Fri, 31 Dec 2021 15:39:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id w16so110007462edc.11;
 Fri, 31 Dec 2021 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SW3UGJt0QxPsev32JLznTOBLLZ4OhUVbGGpwoyykscY=;
 b=OfAaECPk0P5hfq1qHQWDOOUN263rjD3N8KhmaCbTvSMUep330PRpac+vVV2bWBd8U/
 Rz+uphwf9Y3LL97cnWMkZZ779FtJXRlVF96C7veSGCI/6djfjBF1OdSWVPHF3PZ6In3i
 CqtJxTZV2n7HPZfGd1Jq1bumoHTO8HFYosdPM89/UF5A1AaHwNNPpBEgaLDQillo2pI3
 +BKZ68Zd+v0pwnX4smfHRhGQtE2bAylVx1sdHB0tfSqDiLPFdSzwtq6CWMfOQ/FL6P6N
 ZKk5/iZeC3hT/ZQVTRI3xw89dJcOaj4Is/41XigmjdhZ3gvQ64S7DiOomyrH+Z+XEopD
 Wy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SW3UGJt0QxPsev32JLznTOBLLZ4OhUVbGGpwoyykscY=;
 b=LR7l+4CUULfXv0U5qPb+bnPWd0Tli9yGE16247JuBbGdWZurA8mB3WN8VDXl9fqGSf
 Pnm7QIryrdAVPYV2cN6hmaPU2x5Xf89m3ZzgeX5d2WsrWwVjx+9ovk/ac7GOgbyEYSqP
 9YSiFYNUqRIqbOrtmeSU1YNBqoMVX7F0llAR2AjmrN1cSIKjMiSqw7L0+NVmaJ5ikt+o
 CbyUgSoWLRMAYqZrgsKgjZWUnbFq7Ihmn8u3C+dqdFOOSAS46Sc+h2HtIWPzBOlMaVQW
 ZVbIJB2qUPlXMrNajvHbCAwt8ciSQHHkv0pyicCChrsZ081DGDsHWAFP2JDqP6CldxP9
 S4Dg==
X-Gm-Message-State: AOAM5309DPtmTJyF+b4HxxNS7i6qFkOsFs126LLFp1BmE/P5XdyPJcsd
 6I2QJjw8MVy/TEyGKuNf+iumW5JuSx+tdhcmmqeBBpazitw=
X-Google-Smtp-Source: ABdhPJyFaMZrwCkOWYrtCdpD+o3CHe9V4PGKreFCM+z+hJ2SEXILryxc6/TPnRRrjK/anfPm0dXT8mW1RUGcrgqtNXo=
X-Received: by 2002:a05:6402:1b9c:: with SMTP id
 cc28mr34324709edb.219.1640965148245; 
 Fri, 31 Dec 2021 07:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 31 Dec 2021 16:38:57 +0100
Message-ID: <CAFBinCC7iSKjZ=U5PN5FKF9js77tvaQBdWdHMPp_y+u+asaeoA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: meson: fix UART device-tree schema
 validation
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_073915_072094_4630CD86 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Neil,

On Mon, Dec 27, 2021 at 7:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hello,
>
> here are three UART device-tree schema related fixes for the 32-bit
> ARM SoCs.
> These patches don't fix any functionality which is why linux-stable
> is not Cc'ed on them.
The statement above still stands.
I would like you to apply this series to a 5.17-fixes branch because
of a change from the tty.git tree which will be going into 5.17 to
drop the "amlogic,meson-uart" earlycon handling: [0]

To make it clear: Backporting this series to kernels older than 5.17
won't break or fix anything.
Only 5.17 and newer will need this due to a change [0] in the tty.git
tree. Without the patches from this series the 32-bit SoCs won't have
earlycon support in 5.17.


Thank you!
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
