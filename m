Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872DFC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jun 2022 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBPHx2Ob3n8QHVzMJ4MMr7cp0pJTt0HovrYEtVr5rSo=; b=VPo+8S67PYT+PhcyNswaF1eLtM
	TwbyotK8NGxXPrHFqiuf5G2a4+5nafLYg0C3YVgU/mAPWoslUWCyguYkZFn0mtPETJ8Vm4qr6HjTz
	RV49JqfjHYiMru7/xfcbVXfUtnCJRxWtJL6cdj4S41qd3UcfVKdVZ9PVsQpv6kESWSR4V/JGbIaL8
	TO5lz10iO+fDjy2qQqemwRVqJ5cOQ2RfbO2nSjozKHUnSmQlBMVbRxsRcnvvdvGWN2H4AgY/b/0MI
	ByxyAXfb2XIep7gk+opv2UVr38hyLZGYVPD3QDPv3jvFjBlsSOO21RCwUbZEIGu9JWrLsFXslQo74
	tdn+8D4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3EpS-00HVN2-9e; Mon, 20 Jun 2022 10:40:22 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Ep4-00HVEd-6I; Mon, 20 Jun 2022 10:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655721598; x=1687257598;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LeRkSVDTT0Yb76jEsTjO7SM/+tjqpDRALlVCJn6AsZE=;
  b=PHUfaCBHW82fflsie8N9CBbFclS+UaV8Glxj7m5n5kTwYt5/Vbb1tufM
   XeyTbVK81PatKGUFqSpn9BET6KmJI/jpU1vLc6fnv0F7ZVZp9i8AAvMWS
   tCJwewgLBSWVOrSrF12oE7WBsSdrqgcaJ6BvXCxSCr6QE6K3xEpZEDybF
   eWQNXTrDNlsS0beBGuwAiGwzu+gKqnGBGvuXVUQsoNquO+s/tA95ZwgJJ
   3L5Fq1XjqtmIM/l1ram8HsHs/p+SmzJT2/4JQTiLzF+tY/2j7xoElgfJW
   ThlFp3x4LdTDFGjemvBDq0ujBpPxmLD0JFFx/mXT2Kpxi9drZY83NowZZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="277410208"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="277410208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 03:39:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="643056879"
Received: from lspinell-mobl1.ger.corp.intel.com ([10.251.215.169])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 03:39:54 -0700
Date: Mon, 20 Jun 2022 13:39:52 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-serial <linux-serial@vger.kernel.org>
cc: Greg KH <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
    Neil Armstrong <narmstrong@baylibre.com>, 
    Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
    =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
    linux-amlogic@lists.infradead.org, linux-actions@lists.infradead.org, 
    linux-unisoc@lists.infradead.org
Subject: Re: [PATCH 5/6] cleanup: Use UART_XMIT_SIZE
In-Reply-To: <20220620103408.37454-6-ilpo.jarvinen@linux.intel.com>
Message-ID: <aa117e1a-7ec-149b-2337-db4ead968aa@linux.intel.com>
References: <20220620103408.37454-1-ilpo.jarvinen@linux.intel.com> <20220620103408.37454-6-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1889180693-1655721597=:2433"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_033958_283716_0145D518 
X-CRM114-Status: UNSURE (   7.19  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1889180693-1655721597=:2433
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Jun 2022, Ilpo Järvinen wrote:

> Both UART_XMIT_SIZE and SERIAL_XMIT_SIZE are defined. Make them all
> UART_XMIT_SIZE.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Grr, it seems that my internal naming to organize patches managed to leak 
into that summary on subject line. It should have been serial: obviously 
and I only noticed while git send-email was sending the bits out. :-(

-- 
 i.

--8323329-1889180693-1655721597=:2433
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--8323329-1889180693-1655721597=:2433--

