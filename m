Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F1C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Dec 2021 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbQ9eamsCtHxFBth1CWKc3F8WZuNYbsuzFiH7OCOU8c=; b=aM7/zl2XXz2lOW
	Hcqi8PKlZN4NuJl+K7OXd78rBy8q4RQbW0Kt+ibWu9qcPCPRvmV3f/IiFSCVz5B/Pae62Inbr1ZfT
	/0LTZE2P0LkPrfZpjgfJQxfwQhkGGBql96kGjeH6v/Cf1bImqDUERUfr/rZErGEBqlCjFoGwlAqww
	OMoVUasMgq6p5V8/hccZCsom7SXx9+rj0tmLLtTbRpDNR/zCefXNQQKFZbdvKLYDRW3IOhhYffkVJ
	0OxtK/qyosB5hboDdd6Ba3yN+BFgfdfd13JFV/n6fP3MxoGdDeu8L2Cgs5kfvvSijpxGAnaRfn6/C
	kLq7OLzFbjHOwPIO+OAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxChd-00FOrS-Ep; Tue, 14 Dec 2021 18:39:05 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxCeN-00FNad-19; Tue, 14 Dec 2021 18:35:44 +0000
Received: by mail-ed1-x533.google.com with SMTP id b7so7006207edd.6;
 Tue, 14 Dec 2021 10:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2VijXhAq7PPoIytUtJiQziDQ+1sJ+YxGcblV5fEQi9Y=;
 b=kMyj5kZcDc7vJ0G0r+olqpiyY+QcqHR82Kjmsy2TqzRUSyDQAFMeYsu0mozg71xDUp
 Svz12WMWd9pJGQ8APIcDkva/fS10xPUOUpE7YNVoVQpTMIlBDlhwF7RgPPP9IlI6Rb7S
 DwbdL3oeDqHbh6eHct5T5UEk0F+eHvhM/ckwPlp2YHso1C54xD+kEPFyPMTmRlwfsCia
 DLu79no4dm6dAAs0l+tSK4xoNUSuAeiom17BfHzjCMkYfE3J9ZIxqvSbV0ceiWrWO9bs
 5HWtaWf0iedK+rhSpTdUdOLSuzjAmlhkBXQG6dZSkjzDNl/FALqd+Pe0dU9GGKu/wfnk
 DLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2VijXhAq7PPoIytUtJiQziDQ+1sJ+YxGcblV5fEQi9Y=;
 b=gLMAk3LQAlUpVtv2OZzjsWv3w4a2st4CfFze6sJ331X+lZgsoNpF6lMFFico5BQhTS
 /cLxElzfGSaIwlgFYVvDu+FlJ7YKA6zQbwfSSpbpMbO6MwYtPly5+gUC+M4Nsu5Ea+LQ
 baEYSsFD8rO/rBimAki6V7apUOL1qTg5k4cwBNOeEvlNUATvE2b+2ZKDHBGdG16OcLoB
 6LBykGpbKsnNnP/qdZVFDaA+3d95rTZq+DgeWitn+6QcaJA/AjUzbf/wxrfBbHgTdwBR
 v3kqHVMOBtZPCEfnJuRr+1+vd+R9SDdPRZp01rN4QvqnP/9xRDXFKYfxH9lAHod74d24
 quCA==
X-Gm-Message-State: AOAM532xnVj+88HX5NJNJR7+xOvPmDH/XnX8OgABwSmkA4y14HOANJGR
 mNFC42xH9w/nOY/dDqRkIpilXRpwIVkajhSfvQg=
X-Google-Smtp-Source: ABdhPJwN6qcuf6GilYEfxAcZRtvCiadUaXxDhk3n5lxZR+XInneXofDN2QeZQvdrNkCKp/577fNwvOUg1LNfeU1DZPw=
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr10095409eds.386.1639506941061; 
 Tue, 14 Dec 2021 10:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
 <20211212145956.1423755-2-martin.blumenstingl@googlemail.com>
 <CAPDyKFq4Q2M=MimXAERtBy+UY79NwLQs8afGWvvXatOrP_LB7w@mail.gmail.com>
In-Reply-To: <CAPDyKFq4Q2M=MimXAERtBy+UY79NwLQs8afGWvvXatOrP_LB7w@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Dec 2021 19:35:30 +0100
Message-ID: <CAFBinCAD1guDgrFW5Y3H7YBMKFFiDK92AzyoxnDoAPRsPV8xwQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mmc: meson-mx-sdhc: Set MANUAL_STOP for
 multi-block SDIO commands
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_103543_121305_7B925889 
X-CRM114-Status: UNSURE (   9.54  )
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

Hi Ulf,

On Tue, Dec 14, 2021 at 2:21 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
[...]
> > +
>
> Maybe add a comment to explain a bit about this workaround here?
sure, I'll add a paragraph for v2 because this workaround/fix is not obvious

> > +               manual_stop = cmd->data->blocks > 1 &&
> > +                             (cmd->opcode == SD_IO_RW_DIRECT ||
>
> SD_IO_RW_DIRECT doesn't have cmd->data, so checking for that command
> doesn't make sense.
This also means that you found a bug in the vendor driver :-)
I'll drop SD_IO_RW_DIRECT, do another round of testing and then send
an updated version.

Thank you for taking a closer look!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
