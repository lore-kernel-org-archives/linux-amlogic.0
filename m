Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0194AC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:30:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58DE61185
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B58DE61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wq5zNIqGB/ALcbORBCvsOjDXmNWEHfgrUKAT4svzHaA=; b=z1ljD6orRvEa0l
	hwnAgDidTl57gI0XYzSYm/Di9Sy8cGrvaULwqw4MBTUNP+1AwGkPTPQv5tEbMZLOscnCYaRWl9edb
	ayExuXUvp4SrZ4rfi7UpfZru3799Rulx0BZ3rXH71Wz3MjpEuOCgqmEk1KF+U6fGerMV/UnTxRlK4
	eXu6y0NzRD/hMbPKheYLVb0lOUqwZQX2NB3rlO2AA94gu4k9sSMoYaYz0Ot9qvL2S23ZGRQcR7BSm
	zXTQrgKDKtpc8inS+gXl9H+MWy6m7ollRC+Em60hP5X8MdJeyg0d3mfFhOwfd6/I4FzbIhXOHvQM+
	l07meXEgSO54D+VbtdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0Wf-00ByDE-Vc; Thu, 17 Jun 2021 22:30:17 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0Wd-00ByCO-DJ; Thu, 17 Jun 2021 22:30:16 +0000
Received: by mail-ed1-x531.google.com with SMTP id w21so5917782edv.3;
 Thu, 17 Jun 2021 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wITVgltgJl5r151IxWILEHl3H0k8xMn+nPMIK1yBTco=;
 b=A6KpSp9l167+m1JZaayN154StG1sIipUwxo4nt19Ogvbo5r8fOTD648WBix5qzfqB2
 rRfHK83RMO2yQj+sD9D/INjL4zRpZ8vlhhrreqBmubzJHpnlbL2+81QTesPEiS5s8RiC
 Ry4mSUdXdhD5g/9oA3H9jIJgy95lOwBY1tP2xSkv01gFeyScHy1ZA2EEDqglOzFpncx/
 o6bYt+Q4lDgNcUvCQqukMLYFfLMJiJubiDOYYD31VMPiIcDTw9lYdEo7I9DeXKuiXfKr
 Je7E0yYO6qIcQFGgpOa6VUZKRgzipbjmyso3dm0abHgaTHuGgAQ6v5HWbym10Wp9lIm/
 Ui7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wITVgltgJl5r151IxWILEHl3H0k8xMn+nPMIK1yBTco=;
 b=LvCOQQEG9qBXWJcLRFv/4gXyMEcVM27lMc940TfVDN36JGVJIrjYLbXMJo9rTpUCM0
 bdopSyq5FljaZbFy7hYZVZaLnR+9IM5dbGNxKkFdlzLrBDAZHXgbewV9J08Ptu3WifEm
 KdCXNir8RU2WlCN+t+ZjqwpfnkEX3kNbe7TexI8hr9SJge9kOS/519r1q4qWpDXWhCOH
 cGCQqee+rkrDrUR5PfA6OPkiYLwFq1uZwkhauIIM1o3SU8Z80YvFnhJ9ntX01b0mgPC3
 P+NR/LIElS+YCHQX+dtOQ2gWgnKHs4EdSKnWrzNB0pYBuweMVqUHK6RkB2ej8cElrooK
 x5pg==
X-Gm-Message-State: AOAM532YWqu57vgrrcPzgeQrRUx5AEk1VUrz1kOq5ZbbN66zJ8e6jXeN
 Q7ylif014aimtGxhx4sbAk8FDCoZcv9W51vr9Co=
X-Google-Smtp-Source: ABdhPJxXu8wu2qt5mjrLbCpviDnEsgxqXyFVOpxp/qXDwJT4DGreJi/OxhCYS9+dnwJGKW06LqKY6P9GMHuhEfHq85g=
X-Received: by 2002:a05:6402:1153:: with SMTP id
 g19mr741248edw.179.1623969013637; 
 Thu, 17 Jun 2021 15:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
 <20210604190338.2248295-2-martin.blumenstingl@googlemail.com>
 <20210616233109.GA285667@robh.at.kernel.org>
In-Reply-To: <20210616233109.GA285667@robh.at.kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:30:02 +0200
Message-ID: <CAFBinCCE8vmMJE-Y0dvGpT+1QFKVN0U9yKinF_2w+644GaXxYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add the Amlogic Meson8 HDMI TX PHY
 bindings
To: Rob Herring <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, kishon@ti.com, vkoul@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_153015_513147_E0EC0581 
X-CRM114-Status: GOOD (  12.99  )
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

Hi Rob,

On Thu, Jun 17, 2021 at 1:31 AM Rob Herring <robh@kernel.org> wrote:
[...]
> > +description: |+
> > +  The HDMI TX PHY node should be the child of a syscon node with the
> > +  required property:
> > +
> > +  compatible = "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
>
> Is there a sub range of registers for this functionality in
> "amlogic,meson-hhi-sysctrl"? If so, please add a 'reg' property.
yes, for this part of the HHI registers there's a dedicated sub range.
I'll add a reg property with register offset and size

one question about .dts validation: at least the clock controller
(which is also a sub-node of this) does not have a dedicated sub
range.
Is it still OK in this case to set #size-cells = <1> and
#address-cells = <1> in the HHI node?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
