Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E77C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CAXioJmMuPdIeBwLnI539AzPzQQuAklcnVuFdgKzlEw=; b=CVuV6AIT3x6hLh
	jAB202Dnill3fIYc+xq3pxjj5D89waZlY7lo4kgT1P/FQFy2bultkGGOlCD1rIgZNO6Adc86FHek8
	DlZ/4Lil0YJqVqZO86gegllJu5YljkmmRHXsxbyU7MGMqUjRhaSzNA8Qd2oJ4zUroYYliduYW6pfE
	RpnwPW4+ftbUAHnkdY2doHCeNOPhuar5z9qTtKH3n++OW+x65FJ+HfXigbm1dc9hRRPLBNofLg6Md
	VSB7TV8UpY6cm3VrwfXl+c28M6wjOWB+CEbFzmnxJnTzWtSl6xxI6wYHrhZCLJKJb9BGylpGOBWTK
	qi1gnCCQhq7eGOgQV76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCjk-00BeNP-78; Fri, 04 Mar 2022 18:33:08 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCjh-00BeLn-HN
 for linux-amlogic@lists.infradead.org; Fri, 04 Mar 2022 18:33:07 +0000
Received: by mail-ed1-x534.google.com with SMTP id c19so2097426ede.8
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Mar 2022 10:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=pYtIzIXjkV/30U+YOHDMSLeoGHeOM7B85ouGOmUno+o=;
 b=Fi7v9Z3Hdb3vWTrpckKu0kv5AKYx03orRBhbCVw134YKAcsjlQ24ZBwwBEvciJLgS4
 oiY6qKQwYYb/A2NgQfadnhOP0iidKwRpdr+LtVrZnbaBnOvhcswk1cacWwzYVHkzX/pU
 QMKt0D123sPmQW1WRSOGt0xEOXUhzwhzb1lFaPOO1/JzBLLYGyx5bORqMWSE4w8YvPQm
 Hzg6W6VBtpWzoEgZgCEKP/2geeJ3nD16l5T9GipFbSQ7E0t1gzvue0xZ26OhcRRAlxuO
 3Z7ttDJR1DNioToq2gaiTyCrv8m3aGw76qaAeKV07sm53sksI0HULnTqVtZUjEk+Tzc7
 o+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=pYtIzIXjkV/30U+YOHDMSLeoGHeOM7B85ouGOmUno+o=;
 b=TchQInZm6nh4Zgxi6q1BmRUO/4qv++IRcjwn1aQeasTGqfkitwFDUgbvPk+p1EhUvG
 rjSd8bJ2coYkTHPzn1HvNFTLB1wecmlGIrYiSUTKAO5hl7i2VFFm1rnrueMswKcsAzS5
 m/+kNvzyA1pPods1PQc8rkAyf8o06eRqJsF2EmQqVykorZWygO86uzoOi0KJ+cQWmytp
 CB+MOONSqdvYjr8eWnNBxgErcJ0rgSJAjX1838LH1802lOQTJK1QCKihHcZEmwXJb3mm
 HOQXD9WmSYgbR0i5eCUorbjlk78ICXA5aELzsGO0yW1uaSe76lNs+j4+Oe4DMkmMQFFv
 PK1g==
X-Gm-Message-State: AOAM5330u5sH1GYJlPe1as9Gy34z20e/o435/nh3QHBNVu3cRTPQwFfb
 5Ua66AQzI5ga3UURINC6AAI=
X-Google-Smtp-Source: ABdhPJwTgsCXP3ed8BuspF9LH6wx/80bS8q5RbLh7etQzuDyN05OJSGyWT7H5LbLUteD/oCQBPYKUA==
X-Received: by 2002:a05:6402:1908:b0:412:ee38:4186 with SMTP id
 e8-20020a056402190800b00412ee384186mr40436449edz.221.1646418783479; 
 Fri, 04 Mar 2022 10:33:03 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318?
 (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de.
 [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
 by smtp.googlemail.com with ESMTPSA id
 s15-20020a056402520f00b00415e50f8ce1sm2184787edd.54.2022.03.04.10.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:33:03 -0800 (PST)
Message-ID: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
Date: Fri, 4 Mar 2022 19:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/5] usb: host: xhci-plat: omit shared hcd if either of the
 root hubs has no ports
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_103305_649705_9C5EAFF6 
X-CRM114-Status: UNSURE (   8.73  )
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

I have a system with a low-cost Amlogic S905W SoC that supports USB3
but has a USB3 root hub with no ports. This results in an error
message and a hcd that is good for nothing. The USB2 root hub has
ports and works normally.
I think we can do better and omit creating a shared hcd if either of
the root hubs has no ports. This series is based on discussion [0].

The series works as intended for me. What I couldn't test is the case
of the USB2 root hub having no ports.

[0] https://www.spinics.net/lists/linux-usb/msg223416.html

Heiner Kallweit (5):
  usb: host: xhci-plat: create shared hcd after having added main hcd
  xhci: factor out parts of xhci_gen_setup()
  xhci: prepare for operation w/o shared hcd
  usb: host: xhci-plat: prepare operation w/o shared hcd
  xhci: support omitting shared hcd if either of the root hubs has no ports

 drivers/usb/host/xhci-hub.c  |   3 +-
 drivers/usb/host/xhci-mem.c  |  11 +--
 drivers/usb/host/xhci-plat.c |  43 ++++++----
 drivers/usb/host/xhci.c      | 155 ++++++++++++++++++++---------------
 drivers/usb/host/xhci.h      |  20 +++++
 5 files changed, 140 insertions(+), 92 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
