Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B959FC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YhmZQ31aYax1RE+eASreVEETK/TS4Apj5+SfbKKmA9M=; b=y1Kdzvf0ywKpSx
	PxoHUQJSfbqfm2mtZKswVMq+cuuRuJi2/n7AiugVeiRZY1O6JnDrj+ve4riV2gkvcH02pvcb5965J
	b6Q4uors4WJn/aTTfb9DmMig3QGgGX3htrybQY3E/Q/jlOQT7qf6eO0YxqVLmRYs7yoFLZZwX9pkV
	9Jee21RqkXUltJNhDCCwWHCsMBiVDztL2BJamyLUODD/Lx566Vev8Frek+82dYif0/vHH3Uoe+ZCR
	cCC3bC1WAxSxYL7xTUalCakWuGK06paG2GdNv41Zpa0NmiXcCQad/TCkLhzQBe8HrfQJ0BLLAWrtU
	CJjopvDgkixvrqrdAs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbog-00EPVp-C3; Wed, 16 Mar 2022 22:08:26 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbod-00EPVR-6d
 for linux-amlogic@lists.infradead.org; Wed, 16 Mar 2022 22:08:24 +0000
Received: by mail-ej1-x62d.google.com with SMTP id p15so7035120ejc.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Mar 2022 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:content-language
 :subject:content-transfer-encoding;
 bh=H5p7KDojsPR51UiFeLhop4zIdSM2nwHHhjG3xAzjwck=;
 b=TdrbpcdpwrFhtovYeWwlDnhBPxtQoqOAXBFyafrNLg3HFjufI3n4MTWHlq7HeuBSWT
 hIA2D01rnldgmY0kKapDeBaaP4PlQ44DSC9ObPJy5PFsl16yimSLzdlXbVpbyklHSrb2
 VFqeQg8iAyQX+1ZZ1l7Fdsmeq/sdvrqmNuP6amVjraMlaHb71rbFqrF3TgMvKxUm+Rf5
 CB0v05jX8w7DQ8Dq7F8sWYc8n3dQB0TxU/UtUlQyZeydThFGjfM3Wuoxa25GYpgdhfRt
 49oUR+Q9kJoLWu0JzNQc/fiXCb0rIO37gCq+HiB2SYejmirQJt0IhgejXP3b1lC3ObvE
 Ycqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:content-language:subject:content-transfer-encoding;
 bh=H5p7KDojsPR51UiFeLhop4zIdSM2nwHHhjG3xAzjwck=;
 b=kQkKBxqudLaiTQtcIDZqSpBHtzzcecEqrf6Llbd8q44/En6AkYo1lyaPlijW2amzRA
 PAx61BGWPy509rn/h0WlJP5sdHRcsFD9KH60OzqJT8h267dSHiMpD3v1ddmsqVV9sI0x
 wtTSBNxw7CMxg0NbCetgyvpZ5LSc8dFmBczmTwpxy7wxoePMUMI4C1cZPg/wU3IVXAX1
 l7Cb69lLZwCEJTLeG5W09eT5VZQvOdS3NGIEsM69pMQNQ7vITUqzrrSeL5wAWeNxJc/7
 j0+IdD02tXR9JhOXtgVFZjdljt2P63MnMKBSDl71YnUCl50R2BhM180jrYaoGx5gTLcU
 HQaA==
X-Gm-Message-State: AOAM531WDxpgo/xMubOB6MZs2FWrZHh47VlDpbim8BntVkWezqPzU8lR
 qF0KvNj46jR6IMDGPaYN/WaeC5t2g6w=
X-Google-Smtp-Source: ABdhPJzBwRQmn3QTHV9/qO6uSV4xPY7g695ypwauXXfmjgGtdX3YQSYfXkxG4c6aluSN9R4UfWb73A==
X-Received: by 2002:a17:906:be1:b0:6ce:c3c8:b4b6 with SMTP id
 z1-20020a1709060be100b006cec3c8b4b6mr1676819ejg.617.1647468501354; 
 Wed, 16 Mar 2022 15:08:21 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66?
 (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de.
 [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
 by smtp.googlemail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm1646002edt.70.2022.03.16.15.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 15:08:20 -0700 (PDT)
Message-ID: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
Date: Wed, 16 Mar 2022 23:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
Content-Language: en-US
Subject: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of the
 root hubs has no ports
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_150823_314270_50BDA9A3 
X-CRM114-Status: UNSURE (   8.81  )
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

Follow-up to this series could be applying the xhci-plat extension
to other xhci drivers.

[0] https://www.spinics.net/lists/linux-usb/msg223416.html

v2:
- reordered patches
- create new helper xhci_has_one_roothub() instead of using
  xhci_hcd->needs_shared_hcd (proposed by Mathias)

Heiner Kallweit (5):
  xhci: factor out parts of xhci_gen_setup()
  xhci: prepare for operation w/o shared hcd
  usb: host: xhci-plat: create shared hcd after having added main hcd
  usb: host: xhci-plat: prepare operation w/o shared hcd
  usb: host: xhci-plat: omit shared hcd if either root hub has no ports

 drivers/usb/host/xhci-hub.c  |   3 +-
 drivers/usb/host/xhci-mem.c  |  11 +--
 drivers/usb/host/xhci-plat.c |  46 +++++++----
 drivers/usb/host/xhci.c      | 155 ++++++++++++++++++++---------------
 drivers/usb/host/xhci.h      |  26 ++++++
 5 files changed, 149 insertions(+), 92 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
