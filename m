Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFCFCD98CE
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jun 2026 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKmoplgB3YuDSdCrWW01qlZPxlaawvDyRO+EPP7IQF4=; b=fEm12URwN72aE3
	hWtcTZ70fTXueK7fRN9r/Zf3wOuHw1TVXJxzp5+jusCDFYzEQsZHkCWyfmcAnGokUpvmwp06wYsdb
	jT5stDtAok0JqIvf7vSDz4jIkuBxJWq+EyVgEjuqayKwEq+CXc0qABIxwj7aIqO6HWDsVDzHA7qVi
	ePM1bVSIBkeh8iJcHkUeKBWN8gJZdDNI5HK4nEUgDhkslm4ISnjMInEPBb2pyEyN5sTWghwI1z4n+
	m43ZK40jks+B7HBrp7scyvWmxlVrVYKKXS/GdIbWPa5t7kQBIHjvB8CpHVfhNAErKtINrhX+Zd2yd
	+8uOCCsXXwL9YIH9DCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Ge-0000000B7Cl-47Ux;
	Fri, 12 Jun 2026 14:53:56 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Gc-0000000B7Bz-09R7
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jun 2026 14:53:55 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-59ecd51117dso849240e0c.1
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jun 2026 07:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781276032; cv=none;
        d=google.com; s=arc-20240605;
        b=GGDY/55CkUO1QlOM+A1Rd7YzMANte8tTr0KMM9cagOi6OZSzPEYCJrQH6qg6q0UAYf
         wJFe2DQHINX+OxFOCIOsawRGwNHwBW8U/4b0M6V4GVceWG/g67t4JTpgdvpzPwdfLzt4
         e2VM4aCODBJQiGtvQXg8kMYZquaY0RjoKiJrzJZAtXKxQtaDI+JBQYUAhg0eKY6PZ2ZW
         xi3Zg0Kj1L0AeEQ0K0jdAZLsmeEa/kcXvw0F3VKLsfeHmbWaDBK76jXRpeqsFmoJPRyT
         2BnXuSB41Q7TCduOqTJ1HSDjWmxccf0Qb4k9r/2ETQaYKKichdDh0MFPZW6ZW2t7GMaX
         THfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=;
        fh=5gGHkI310nET9gnFfIKSCS2ZUL5Dj2mJIbeAlOq9sDo=;
        b=Tbvwjby9uFx52mmUvUZPL4BY+xFvnjSm8C+emCMGC+p9VPXyLwzSWBxdRqXBXFa4hq
         J97Wblkut+uq3SZDF5fob9DQ/DBUadnZiaVaePd3W9C8/PLUsBjHHW/FiWERJiaI5bU6
         b0CTcRE3v12MeZKzMIknOLG3lJXhYx/mrhwPWp0n1/Pj0BAUh3k1iWoxmwugihAByNpM
         DngPJSEZSaPFhZpYDHJHY5P8zYw573h2FA5Esa2itONauAHheSlm4ivDEZmbq6oIXxOs
         q/1acPSoy+mVWeANNdQkSJ8ZzdgX//SjLoorfmdeVKFsQQQ193O2vF1VGSTbxohvDN/p
         Umjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781276032; x=1781880832; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=;
        b=TcYHAQhp6BRGMNcoOXv0aZ7k8+BCTnxpK0B7f0O1CU9HWXQ5Y9PePEoKIhgdh2uAtC
         bqenmNCqcX97MatVMhFqZ82dr5LJ3g9Sxu4txRmx9nAtD7pbRxWxESkUhrTCIJroE8TL
         RTMhr0GJl9by+F0xq/47PetZ6vIiNiOOl09ywSEiKe3tF0yuEbfavYgLsDtTPAbpZR8V
         hJq9WC0kHWjysmds0UdosH/dQ56YOG/AjpvHTly8qBbxPwp9t+9raQ2qSQ6kP0aTRijO
         qaHuTXCzpipA7A6eiT6wokaCV/PnHwYbVnPJhr+ime0ByYuyYZrLYtPY8GC/NhnSoNTO
         PPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781276032; x=1781880832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=;
        b=VBNtnyfqCaUewnYUJaPB95YwrwIZueL2SriwlbJt6594yGzb8mfaw6sF+MP4n595SH
         VSZv7xev3X9MY8sxz5/u5eWuZSUmRwnJg7B57J0wdkmIxDgogZt+Q6Gv17fEumsX45TV
         QuhJ3igCNdiWRIudY34mAXQWEg5p1cgriu7cjPVUgyD5MC3ndx1hXfHb1nlxHR8dQfME
         lVxQnHXTLcAe+PJMMtKMkKxf58Wr6cmeiyDKzKF9RwUKU/VHG3q3yfhoSTbZYATmzn/I
         eHQDuSbdSds9Xa9NsYOlx6MYJJsd1mKtwCWoqrC6Rx7COhSpJiUmo3kB/CmwMIBfG+we
         gKBg==
X-Forwarded-Encrypted: i=1; AFNElJ+voppE0SOvT0mNVDAB9WDR/flcFcAYODgeRTCzbcjAfbWqh4OuF+47VZpzwOeioubb+n4HOiH8vQEeZE62@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu7Hl0e1/fdWf+Jo6p/+OCQ2AkusheCVYcm1uA1pljQd9SUiPx
	mc6R+aAIaYxo0Yqn3+QS9nny8ImEJXqEulqo4SwQ2k5JQISaEwsgLz/Ve8js321VOfq65qKB/5l
	3ri2QDLl06lytLjkYdrTerZn92YbG8NE=
X-Gm-Gg: Acq92OFUEKlTPs0LtIKDNluMCi+tfgszKT5F6KiQfiMJ9z9lbOIHAivdWcmVXnA42RB
	hvUcOADnlf10bNB/pMLdvyG2iAROn7rGysxXXXs2YtsvcrseS292OiVxROGCWIwo+JSsB0pXJ2m
	MBb7NzbmG69oi/dX5glhJp7sARWVBoMxOQoysWZZe8NWN8QddEdDiGiFBIjsSyjmbACQ+5Y6OpC
	qXXYwguIkRFRFerrDIcBlv1jJ+srabV5Fh9pwx3yEP4wEhaUk+XAigXoe2rUmHMCcBc0iQb6Xa0
	OfryOGameAJjyRvtIJuVNSWPQtdNmdkX2YF6yZxBXREKSIzHJg==
X-Received: by 2002:a05:6122:6503:b0:59b:f9b4:8748 with SMTP id
 71dfb90a1353d-5bb69fa3ff1mr1022262e0c.4.1781276032418; Fri, 12 Jun 2026
 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
 <20260611221000.GA524832@bhelgaas>
In-Reply-To: <20260611221000.GA524832@bhelgaas>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Fri, 12 Jun 2026 20:38:41 +0545
X-Gm-Features: AVVi8CeSnuFKBXw07pnZfggT3zcPEONqkcJp-rRWL-FHYqitFjSsHZlw-QFmmE4
Message-ID: <CANAAWHKBFmgQfqUNaiUrPxBk4bPoBpRbhJs9YqszKvBUbUrMXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Fan Ni <fan.ni@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_075354_103728_DF8215EE 
X-CRM114-Status: UNSURE (   7.15  )
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

Hi Bjorn,

> I guess this prevents a NULL pointer dereference, right?

Yes. This is in the CONFIG_PCIE_DW_DEBUGFS teardown path when the
controller does not advertise the RAS DES capability.

In that case dwc_pcie_rasdes_debugfs_init() returns 0 before allocating
pci->debugfs->rasdes_info or initializing reg_event_lock. Later,
dwc_pcie_debugfs_deinit() still calls dwc_pcie_rasdes_debugfs_deinit()
unconditionally.

With CONFIG_DEBUG_MUTEXES, mutex_destroy() dereferences the mutex, so
calling it via &rinfo->reg_event_lock when rinfo is NULL would
dereference NULL. Without CONFIG_DEBUG_MUTEXES, mutex_destroy() is a
no-op, but there is still no RAS DES state to tear down.

So the patch makes the deinit path match the init path: if no
rasdes_info was allocated, skip the RAS DES mutex teardown.

Thanks,
Shuvam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
