Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72D9CCF9F0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Oct 2025 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QN48eyFrzqy3e5bN3SzHnwKMIX7u74iWS3rn4sAHaEw=; b=aPIGGHCCjhLuRg
	sUPyVSPy0jVbX+SYssLM42pVdpNIfltHuKBw3rfa+VH3q2Yh/6UtNhLdrNAY/ZMvaRINyA/rW1C8W
	vofyi58fGaEC49UCsov9shSD20OnP23MRDLpAky6FhL8Z6bvKRVZWqPmXB7o9Tfgv5dWDBo88O7uF
	vPZsnx4JM3PdIJwaxhkQVv5lAAW5XEYQwK9XLrD9nYqMZcbqmeR6njaRXnwLTxa94lzIv2t76ObCm
	Y/y8ErSLoT0SBLa1CPzmwYTaBYVxA+JOxc/qdQX3s8Dv3PvAo45eodhUWqYsXu1eNEa7ATyzsygPT
	AOcIY4rvrNT15VPlYQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbE8-000000054q7-2i90;
	Thu, 30 Oct 2025 22:34:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbE6-000000054px-2ssW
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Oct 2025 22:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C83E160255;
	Thu, 30 Oct 2025 22:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F8DC4CEF1;
	Thu, 30 Oct 2025 22:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761863677;
	bh=G4Yiz/LALEjDxLYZP+aL0NeqsH24ZRVAOIw1IXa6xOY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Oga7oDxBFs1u1XLldAtpT5BGbwo7QQeT1r2/wZjcQ0MrAY7PzZ1xNKjp8G/HGGq8O
	 ySE/wkiz768TadltWtuu9YS6jVivgJ0JCcQi4zGfX1MyHC51MF/qlSwxym2H4ryTxD
	 s+YPoV/089EJmJB/zo/62MbxC0DNdeuAle9vZUuR6vdVnvzDbhF9tmg7Z/dnjwr63+
	 hUMdTLrvx4rAZmohl6vQtI9NTCFpXOkV+vtgqsqflv/FpoRppqMLJ3GpWkTVlZyILJ
	 5AGOLG+eKJXu2X5ZYIG0nQCN3g0GXhH0EjbTIzjh//kOH80pE73zFqo0W02rZoO1dZ
	 TYZJum+kJPStw==
Date: Thu, 30 Oct 2025 17:34:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linnaea Lavia <linnaea-von-lavia@live.com>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
Message-ID: <20251030223436.GA1657470@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023164205.GA1299816@bhelgaas>
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

On Thu, Oct 23, 2025 at 11:42:05AM -0500, Bjorn Helgaas wrote:
> #regzbot ^introduced: v6.18-rc1

#regzbot report: https://lore.kernel.org/r/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com
#regzbot introduced: f3ac2ff14834

f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
