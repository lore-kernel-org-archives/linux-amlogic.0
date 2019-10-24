Return-Path: <SRS0=/s/K=YR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C3FCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2019 20:05:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B06520684
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2019 20:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoXWZ7Ku";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XeuUCZnW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B06520684
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWseiHZRJsaSn4d3MAQnAiqgqJkgWcYOmJMJVqs8Hcs=; b=CoXWZ7KuA6Rw2F
	8VPxl2xYDaAyF6WqctTOSF7VLW7fnzE244EvcfcTr67V8/UTv4pOopcz//hUFtt6TbrOC9e0JRVj9
	cjDJr8KvbyWcqs6n9WB48JBK1meN3xBQ1Q89WQjFCe3s522r/ax7xJOy/zQ/ylvGJZf1VZxeUAGBc
	sJxwkutit5fCECSevQ4gyUbIs3BIfULBM3ksm+A2m4LSm6qDIyywIfsyKiTg6KEbHQq52oU0ox+mn
	Zi5LqCYYJjr52W0Fzu+ITCJazhdC1GVw1/7Vxru5X8W4p7h8oW2TS+JHqNBlGccBZcLz6vIESzAGP
	PFB26NcRl5nrL2jQ1Y1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNjML-0004vm-Tq; Thu, 24 Oct 2019 20:05:25 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNjMJ-0004vB-Eb; Thu, 24 Oct 2019 20:05:24 +0000
Received: by mail-ot1-x342.google.com with SMTP id e11so110894otl.5;
 Thu, 24 Oct 2019 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WBu2xp9K0zCOL1CqUzXovGKYVoxLAufXdkmrTgDj8jU=;
 b=XeuUCZnWm+hwRU+YDhkMiG+NVrUiKaMWKxalRYws5Dzubg9r6peqH919pIJQL7S6N/
 NBe3UEqVehjYYOxKUUL5zg0dL3zlAn3OM8w5S09lNGRMdNVqvQXEHg33uqQ5kCz+Di+o
 pIHF0gUm0+B1RgFegsIs7AHWrZBuzJ51xk+rhKUfV7DEhHaOet71iMWx+300Ss/+LHPb
 Dch1IxrwWVMZN7V9oNdOwwZd9oLuTkKmvJ1L30MQVRUIRqRr/wSrBx2oG7/j0AAnRXPW
 4lhLBI2wz4CKedPaUc1oilbsH/1BZQetKCngek8F+mihvu4UYVe9rnXg891J4BqKXoa/
 QfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBu2xp9K0zCOL1CqUzXovGKYVoxLAufXdkmrTgDj8jU=;
 b=aEXi04xi9h1e7J74+zQwbdjOZvGW1/gvppTyf57O8aageapjrBlvy4O5ukFBVUah26
 LWVzep5fpdGETk98wMOqloTfJBasvwM3kgrGJW2sbqguEpQG1+6k+Z4X2KStprnvlVvU
 39OgoHOUBVKIPcc7gNL77y7YFgIshdkFPfB/g5FqsMqokA95Fv7EEVKxzNmh2/5zSH3f
 s9NIYhBrWZ2FpXi+qPaCx4qRzmsVJZR6pB8s8y5svwvSZZ7c5hrVuZkjtcQFxGqHN693
 pFjcm/T3gndfndyzc1F4HFzSvuWaL3eyXl4EqkONji69uro4I6S9ff6sxl41iMl8S32T
 vlQQ==
X-Gm-Message-State: APjAAAVJC6RQAwYJCffX3gIgA3WPdpfBL9QetuPv3rfCXp2dthmJqC5W
 l2sWuOiUbfGApIuYW3uy9u+yZC/DVo+Wdzn9pqNwssuNw/c=
X-Google-Smtp-Source: APXvYqyRn/htFtolYG6Dci882WX0tr+nJ6yni26IiDGYunzupqqnQojwMGy/hzW8960t1cB1jsSIJVVzhMr0jQjVgt8=
X-Received: by 2002:a9d:66da:: with SMTP id t26mr8688309otm.98.1571947522449; 
 Thu, 24 Oct 2019 13:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191021132322.25256-1-narmstrong@baylibre.com>
 <875zkhdye5.fsf@gmail.com>
In-Reply-To: <875zkhdye5.fsf@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 24 Oct 2019 22:05:11 +0200
Message-ID: <CAFBinCBOEG6GT=dp5XQ3+nC18axSodPbgMfE6F7eHLE3gZfSoA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc3: Move Amlogic G12A DWC3 Glue
 Bindings to YAML schemas
To: Felipe Balbi <felipe.balbi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_130523_516483_2DAA4D09 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Felipe,

On Tue, Oct 22, 2019 at 9:39 AM Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
>
> Hi,
>
> Neil Armstrong <narmstrong@baylibre.com> writes:
>
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for the Amlogic G12A DWC3 Glue Bindings over to a YAML schemas,
> > the AXG and GXL glue bindings will be converted later.
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Is this a thing now? Why do we need a new format?
this is a 2019 thing now, see an initial announcement from Rob from a
year ago: [0]

the new yaml schemas allow validation of the actual .dts
this can be used for verifying that the example in the dt-bindings is
correct, as well as for verifying the actual .dts file (so they match
the actual dt-binding)
(Rob's old mail - linked above - still has these two on the TODO list,
nowadays this works fine)

Neil is working towards full yaml schema based validation for all IP
blocks used on Amlogic SoCs.
with this patch we get a bit closer to that goal


Martin


[0] https://lwn.net/Articles/767723/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
