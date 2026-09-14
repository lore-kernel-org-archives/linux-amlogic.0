Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195A6C88E72
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE4+/BDstaXEif6l4JQS0j0caf3lAz0cCZEzpzDCztM=; b=cL6jR/fEV9gVWb
	1vutH0R3YKD054gwy7S+Pj3cug8tYJnKrJaH8J0AvFRRsyXkSNk953bKs714Rt8zq1M8/kWL16bfu
	osFfPODT3TzScWL42JnaaHOF84V5LlRnDtPf8ihQ+im/CKmh2eHo73uSuKi5xa9RHm6SZxUOeACZz
	IKg3cgfXWMbgeJWgRrl6D4dS/vaTt/Q1lyQj670ETM7UMlbFQVlJOuhhKdD+tUQbZNHgut6rpU8Ab
	EhnskRaFyjGqbeYh+rU+v3g9N3XvYg+xmTQW7JOSDARBmdHw28Te1TH8BYdvuRWfeyIuRjt+c8VNM
	ECD4fgExescnRtmHaUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67R2-00000003wqW-2h7S;
	Mon, 14 Sep 2026 14:13:28 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Qx-00000003woS-32Gd;
	Mon, 14 Sep 2026 14:13:28 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 6BE34717EC24; Mon, 14 Sep 2026 16:13:17 +0200 (CEST)
Date: Mon, 14 Sep 2026 16:13:17 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <aqgA_bGo3yqBNL0_@desktop>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
 <aoNY85rdMdBDSiGW@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoNY85rdMdBDSiGW@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_071323_910884_C9B5A9BD 
X-CRM114-Status: GOOD (  21.46  )
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

Hi,

On Mon, Aug 17, 2026 at 09:54:43PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 04, 2026 at 03:59:34PM +0200, Link Mauve wrote:
> > This callback used to take a mutable void * for no reason, which causes
> > the compiler to be unaware that the val buffer should never be modified
> > by the callback.
> > 
> > This was found while drafting the nvmem-provider Rust abstraction.
> > 
> > Thanks to the guidance of Andy Shevchenko, this now introduces a new
> > callback and deprecates the existing one, with the goal of renaming the
> > new one into the old one once no user remains in the kernel.
> 
> FWIW, if the approach taken is okay by maintainers,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks for the review!

> 
> I think this is right direction to go. We should use all possible ways to
> protect the data from corruption.

Sorry for not pinging again before the end of the 7.3 merge window, I
was on vacations, but this only delayed that work by one cycle.

Is there anything I could do to make it happen for 7.4, or should I just
wait until a maintainer picks up that series?  I just tested and
everything still builds file on top of linux-next as of next-20260911.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Link Mauve

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
