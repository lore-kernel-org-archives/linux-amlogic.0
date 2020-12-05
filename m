Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A36C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 19:56:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D0122DBF
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 19:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D0122DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=naCpgfuzqpkRVGBQKfFce9NDOVyPY7buarmkRpFn6ms=; b=1sl6q3yaaA1EZAWN4KGUh0iw6
	zZsQt+8a6FRUMjIGwxUr1fUvyW/GCa76sPe7aURv1YCFtO51mH7g4jaR5m7BywPUfVsld55EJcJw+
	F+ZoXfrj71688xIy3+/siLUC+xrHg9Wkg7bwj+z224bQHKPpl3FOVxm0N62qQf9TsS+BeNX7MysYL
	bo0+9FJdjfNCzL8sfNqSwdFNdeluVqll0HSdvWgW7rVKOG7pUcgBpIbCxqqlaHfRRqKdIULe6IH5Z
	G7uxYq0TjB+G3Ad1bs0FBD+PyVAbHxohtotCiy/d4xe3Z/e/ih1ITCG9VzsQY2+mliZ/2mPTCnLYC
	LMeHIABpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kldf0-0008JW-WD; Sat, 05 Dec 2020 19:56:03 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kldey-0008J5-Bb
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 19:56:01 +0000
Received: by mail-ej1-x631.google.com with SMTP id g20so13748361ejb.1
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 11:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROWn+J4HOSplu4nLzjwMPIdkxpg/fGpt9/VfOHptWPk=;
 b=uEDVc4D3cDu9qkXyID+22IFVb9VkQ5attaXJr5nvfNlAXM7spgAMN1CtgQ0z+m2Ldg
 5cnfOkfgq/M/gtQ/zLdEie1LZElCGXfCZCWfg6Bhjm0l0V1j3b5QwO2uvyHXXf/cB47z
 /TJJIM4pzNsyL6OfW2nDq+1JcVCUD16e1UHrROJndsjyuexGeB0MCz4Ouao/JA+PHMXf
 ZowhDa/FW0SmblWV6LqoxbP5Fm7/NONEFH7+6HOFPkA35bi4PspxxLZr4lxF+mbbEe/6
 cvpy/GVhJMYXzgnV2T5AL9vXX5w2vXKoiMkw+se6bxzniqXLIVvceIK19upeG1GccwLx
 tdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROWn+J4HOSplu4nLzjwMPIdkxpg/fGpt9/VfOHptWPk=;
 b=tkLXsu2IyoodukiFvDNn/WEvEEdwI24bH/mef5B3dcQUzadx1QVWN9rFzVyUZuSlBb
 LzeZYdXOif3Z8Px9ncMS1IdtIIqcoNKpIho/hIYyQ29q4y1KFDtbtIhnci20bLp5yYvM
 XZRuYIA+E0xyGmVw5IfJrRVyj/RGbkIRs6nvmBAfRMzm/KNTsfwJ8eateKutGmbxAGcL
 BNLzyeQ4GLYZngObp+XYPwZBA0O3RIb29m2FF7yxmY5rEIN0hpfOIqtkyd5Bb2TzQJ7D
 PsIhva5fWof8bihrdK/68IwCHl0nxTz/CX2EgKXwMme/Yft7XIdXvtUg8v1ElQHec+iB
 rg3A==
X-Gm-Message-State: AOAM530KE89U2QiW2uGpShIWax9rRWDNZXYGLjuP+jIpepNVTjSme+ZK
 3MXGnQjta6Koz8mr9vhM2hR7HAPffhVFly0BWEqI7nueAz8=
X-Google-Smtp-Source: ABdhPJwFc6wy71DR4VukeWr5zqeRA2TeWbrib3ooUQEwVQUAHgl6cYe7ykW3WZyKciUeXCaZ75apBHt4tQHzt/J21bo=
X-Received: by 2002:a17:906:4050:: with SMTP id
 y16mr12190310ejj.537.1607198159023; 
 Sat, 05 Dec 2020 11:55:59 -0800 (PST)
MIME-Version: 1.0
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
In-Reply-To: <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 20:55:48 +0100
Message-ID: <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Otto Meier <gf435@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_145600_478245_FD823538 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Otto,

On Sat, Dec 5, 2020 at 6:40 PM Otto Meier <gf435@gmx.net> wrote:
>
> Hi Martin,
>
> i have tried your second notice. but it does'nt solve the issue.
> if at leased on device is pluged in new devices are detected. if
> all devices have been removed, no new device will be detected anymore.
thanks for trying this out and for reporting back.
can you please also test if running "lsusb -vvv" (as root) makes the
devices show up?

background info: the Amlogic Meson GXBB SoC on your Odroid-C2 board
uses a "dwc2" USB 2.0 controller.
I don't have any GXBB based board, but my Odroid-C1+ uses the same
controller and overall setup. There I can reproduce the problem you
are seeing.

I am not sure which part of the "infrastructure" (on-board 4-port USB
hub, dwc2 controller, ...) is causing this issue.
My suggestion is to involve the linux-usb mailing list and dwc2 driver
maintainer:
- Minas Harutyunyan <hminas@synopsys.com> (dwc2 driver maintainer)
- linux-usb@vger.kernel.org (usb mailing list)

In the past they provided information and helped to debug issues.
Please also keep me Cc'ed so I can help with any Amlogic specific
questions, drivers, etc.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
